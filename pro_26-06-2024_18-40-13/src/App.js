import React, { useState } from "react";
import Uppy from "@uppy/core";
import { Dashboard } from "@uppy/react";

import "@uppy/core/dist/style.min.css";
import "@uppy/dashboard/dist/style.min.css";
import { uploadFilesApi } from "./upload";

function App() {
  console.log(process.env.REACT_APP_GITHUB_TOKEN)
  const [pass, setPass] = useState("")
  const [folderName, setFolderName] = useState()
  const [uppy] = useState(
    () =>
      new Uppy({
        allowMultipleUploadBatches: true,
        allowMultipleUploads: true,
      })
  );

  uppy.on("complete", async (result) => {
    const files = await Promise.all(result.successful.map(async (file) => ({
      file,
      buffer: await getFileBuffer(file)
    })));
    await uploadFilesApi(files, folderName);
  });

  return (
    <div className="App">
      <input placeholder="PASSWORD" type="password" value={pass} onChange={(e)=>setPass(e.target.value)}/> 
      <input placeholder="FOLDER NAME" type="text" value={folderName} onChange={(e)=>setFolderName(e.target.value)}/>
      <Dashboard
        uppy={uppy}
        fileManagerSelectionType="both"
        proudlyDisplayPoweredByUppy={false}
      />
    </div>
  );
}

function getFileBuffer(file) {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.onload = () => {
      const base64String = btoa(
        new Uint8Array(reader.result).reduce(
          (data, byte) => data + String.fromCharCode(byte),
          ''
        )
      );
      resolve(base64String);
    };
    reader.onerror = reject;
    reader.readAsArrayBuffer(file.data);
  });
}

export default App;
