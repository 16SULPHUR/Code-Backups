import { getFileBuffer, getFormattedDateTime } from "./helpers";
import axios from "axios";

export async function uploadToGithub(files, toast, folderName, onProgress) {
  const token = process.env.REACT_APP_GITHUB_TOKEN;
  const filesWithBuffer = await Promise.all(
    files.map(async (file) => ({
      file,
      buffer: await getFileBuffer(file),
    }))
  );
  const basePath = getFormattedDateTime(folderName || "");

  try {
    toast(`Saving file(s): ${basePath}`)
    const totalFiles = filesWithBuffer.length;
    let uploadedFiles = 0;

    const updateProgress = () => {
      uploadedFiles += 1;
      const progress = Math.round((uploadedFiles / totalFiles) * 100);
      onProgress(progress);
    };

    const treeResponse = await axios({
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
      method: "get",
      url: "https://api.github.com/repos/16SULPHUR/Code-Backups/git/trees/main",
    });
    onProgress(10)
    const currentTree = treeResponse.data.tree;

    const newTreeEntries = [];

    for (const { file, buffer } of filesWithBuffer) {
      const relativePath = file.meta.relativePath || file.data.name;
      const path = `${basePath}/${relativePath}`;

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

      newTreeEntries.push({
        path: path,
        mode: "100644",
        type: "blob",
        sha: blobSHA,
      });

      updateProgress();
    }

    const combinedTree = currentTree
      .map((item) => ({
        path: item.path,
        mode: item.mode,
        type: item.type,
        sha: item.sha,
      }))
      .concat(newTreeEntries);

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

    const parentResponse = await axios({
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
      url: "https://api.github.com/repos/16SULPHUR/Code-Backups/git/refs/heads/main",
      method: "get",
    });

    const parentSHA = parentResponse.data.object.sha;

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
    return true;
  } catch (error) {
    console.error("Error uploading files:", error);
    toast.error("Error uploading files")
  }
}
