import axios from "axios";

export async function uploadFilesApi(files, folderName) {
  const token = "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";

  // Helper function to get the current date-time formatted as dd-mm-yyyy_hh-mm-ss
  function getFormattedDateTime() {
    const now = new Date();
    const day = String(now.getDate()).padStart(2, "0");
    const month = String(now.getMonth() + 1).padStart(2, "0"); // Months are zero-based
    const year = now.getFullYear();
    const hours = String(now.getHours()).padStart(2, "0");
    const minutes = String(now.getMinutes()).padStart(2, "0");
    const seconds = String(now.getSeconds()).padStart(2, "0");

    return !folderName?`${day}-${month}-${year}_${hours}-${minutes}-${seconds}`:`${folderName}_${day}-${month}-${year}_${hours}-${minutes}-${seconds}`;
  }

  const basePath = getFormattedDateTime();

  try {
    // Get the current tree
    const treeResponse = await axios({
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
      method: "get",
      url: "https://api.github.com/repos/16SULPHUR/Code-Backups/git/trees/main",
    });

    const currentTree = treeResponse.data.tree;

    // Create blobs and prepare new tree entries
    const newTreeEntries = [];

    for (const { file, buffer } of files) {
      const relativePath = file.meta.relativePath || file.data.name;
      const path = `${basePath}/${relativePath}`;

      // Create a blob for the file
      const blobResponse = await axios({
        headers: {
          Authorization: `Bearer ${token}`,
          "Content-Type": "application/json",
        },
        method: "post",
        url: "https://api.github.com/repos/16SULPHUR/Code-Backups/git/blobs",
        data: {
          content: buffer,
          encoding: "base64",
        },
      });

      const blobSHA = blobResponse.data.sha;

      // Add the new file entry to the new tree
      newTreeEntries.push({
        path: path,
        mode: "100644",
        type: "blob",
        sha: blobSHA,
      });
    }

    // Combine current tree and new tree entries
    const combinedTree = currentTree.map(item => ({
      path: item.path,
      mode: item.mode,
      type: item.type,
      sha: item.sha,
    })).concat(newTreeEntries);

    // Create a new tree
    const newTreeResponse = await axios({
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
      method: "post",
      url: "https://api.github.com/repos/16SULPHUR/Code-Backups/git/trees",
      data: { tree: combinedTree },
    });

    const newTreeSHA = newTreeResponse.data.sha;

    // Get the parent commit
    const parentResponse = await axios({
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
      url: "https://api.github.com/repos/16SULPHUR/Code-Backups/git/refs/heads/main",
      method: "get",
    });

    const parentSHA = parentResponse.data.object.sha;

    // Create a new commit
    const commitResponse = await axios({
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
      method: "post",
      url: "https://api.github.com/repos/16SULPHUR/Code-Backups/git/commits",
      data: {
        message: `Add files in folder ${basePath}`,
        tree: newTreeSHA,
        parents: [parentSHA],
      },
    });

    const commitSHA = commitResponse.data.sha;

    // Update the reference to point to the new commit
    await axios({
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
      method: "patch",
      url: "https://api.github.com/repos/16SULPHUR/Code-Backups/git/refs/heads/main",
      data: {
        sha: commitSHA,
      },
    });

    console.log("Files uploaded successfully");
  } catch (error) {
    console.error("Error uploading files:", error);
  }
}
