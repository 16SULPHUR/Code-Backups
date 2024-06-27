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
          >
            
        <div style={{width:"100%", color: "#000", fontWeight:"bolder"}}>{progress}%</div>
            </div>{" "}
        </div>
    </div>
  );
};

export default ProgressBar;
