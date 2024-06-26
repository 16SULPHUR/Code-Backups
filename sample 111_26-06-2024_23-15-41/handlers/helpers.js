export async function getFileBuffer(file) {
    return new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.onload = () => {
        const base64String = btoa(
          new Uint8Array(reader.result).reduce(
            (data, byte) => data + String.fromCharCode(byte),
            ""
          )
        );
        resolve(base64String);
      };
      reader.onerror = reject;
      reader.readAsArrayBuffer(file.data);
    });
  } 

  export function getFormattedDateTime(folderName) {
    const now = new Date();
    const day = String(now.getDate()).padStart(2, "0");
    const month = String(now.getMonth() + 1).padStart(2, "0"); // Months are zero-based
    const year = now.getFullYear();
    const hours = String(now.getHours()).padStart(2, "0");
    const minutes = String(now.getMinutes()).padStart(2, "0");
    const seconds = String(now.getSeconds()).padStart(2, "0");

    return !folderName?`${day}-${month}-${year}_${hours}-${minutes}-${seconds}`:`${folderName}_${day}-${month}-${year}_${hours}-${minutes}-${seconds}`;
  }