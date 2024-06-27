import React, { useState, useEffect, useRef } from "react";
import Uppy from "@uppy/core";
import { Dashboard } from "@uppy/react";
import "@uppy/core/dist/style.min.css";
import "@uppy/dashboard/dist/style.min.css";
import { uploadToGithub } from "./handlers/folderUploader";
import ProgressBar from "./ProgressBar";
import "./App.css";
import { Bounce, ToastContainer, toast } from 'react-toastify';
  import 'react-toastify/dist/ReactToastify.css';

function App() {
  const [pass, setPass] = useState("");
  const [folderName, setFolderName] = useState("");
  const [uploadProgress, setUploadProgress] = useState(0);

  const uppy = useRef(
    new Uppy({
      allowMultipleUploadBatches: true,
      allowMultipleUploads: true,
    })
  ).current;

  useEffect(() => {
    const handleComplete = async (result) => {
      if (pass === process.env.REACT_APP_SECRET) {
        setPass("");
        const filesToUpload = result.successful.filter((file) => {
          const relativePath = file.meta.relativePath || file.name;
          return !relativePath.includes("node_modules");
        });

        if (filesToUpload.length === 0) {
          toast("No files selected for upload as node_modules is not allowed.");
          return;
        }

        setUploadProgress(0);
        const success = await uploadToGithub(filesToUpload, toast, folderName, (progress) => {
          console.log(uploadProgress)
          setUploadProgress(progress);
        });

        if (success) {
          toast.success("Upload successful");
        }
      } else {
        toast.error(pass==""?"Enter Password":"INCORRECT PASSWORD");
      }
    };

    uppy.on("complete", handleComplete);

    return () => {
      uppy.off("complete", handleComplete);
    };
  }, [folderName, uppy, pass]);

  return (
    <div>
      <h1 className="app-title"></h1>
      <div className="App">
        <div className="content-wrapper">
          <div className="input-container">
            <div className="input-group">
              <label htmlFor="password">Password</label>
              <input
                id="password"
                className="neon-input"
                placeholder="Enter password"
                type="password"
                value={pass}
                onChange={(e) => setPass(e.target.value)}
              />
            </div>
            <div className="input-group">
              <label htmlFor="folder-name">Folder Name</label>
              <input
                id="folder-name"
                className="neon-input"
                placeholder="Enter folder name"
                type="text"
                value={folderName}
                onChange={(e) => {
                  setFolderName(e.target.value);
                }}
              />
            </div>
          </div>
          <Dashboard
            height={400}
            uppy={uppy}
            fileManagerSelectionType="both"
            proudlyDisplayPoweredByUppy={false}
            theme="dark"
            className="custom-dashboard"
          />
          <ProgressBar progress={uploadProgress}/>
        </div>
      </div>
      <ToastContainer theme="dark" draggable={true} stacked  />
    </div>
  );
}

export default App;
