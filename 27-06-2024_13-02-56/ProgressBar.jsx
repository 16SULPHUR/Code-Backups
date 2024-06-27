import React from "react";

const ProgressBar = ({ progress }) => {
  return (
    <div style={{display:"flex", flexDirection:"column", textAlign:"center", display: progress ? "block" : "none"}}>
        <div
          className="progress-bar"
        >
          <div
            className="progress-bar-fill"
            style={{ width: `${progress}%` }}
          ></div>{" "}
        </div>
        <div style={{width:"100%", color: "#00ff1e", textShadow:"0 0 10px rgba(157, 255, 0, 0.7)"}}>{progress}%</div>
    </div>
  );
};

export default ProgressBar;
