import React from 'react';

const ProgressBar = ({ progress }) => {
  return (
    <div className="progress-bar" style={{display: progress?"block":"none"}}>
      <div
        className="progress-bar-fill"
        style={{ width: `${progress}%` }}
      ></div>
    </div>
  );
};

export default ProgressBar;
