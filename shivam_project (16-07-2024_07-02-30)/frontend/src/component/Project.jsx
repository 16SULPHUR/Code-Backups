import React from "react";
import project from "../image/p1.svg";
import css from '../image/css.svg'
import html from '../image/html.svg'
import js from '../image/js.svg'
import php from '../image/php.svg'
import tailwind from '../image/tailwind.svg'

function Project() {
  return (
    <>
      <div className="h-screen flex justify-center items-center">
        <div className="flex justify-evenly items-center w-[80%] shadow-3xl rounded-xl m-auto p-10">
          {/* image */}
          <div className=" w-fit">
            <img
              src={project}
              alt="image"
              className="h-72 w-96 rounded-xl shadow-3xl"
            />
          </div>

          {/* content */}
          <div className="w-1/2 p-8 rounded-xl shadow-3xl space-y-2">
            {/* title */}
            <div>
              <h1 className="text-2xl font-semibold">Title</h1>
            </div>

            {/* data */}
            <div className="text-md text-slate-400 font-semibold text-justify">
              Lorem, ipsum dolor sit amet consectetur adipisicing elit. Unde
              necessitatibus earum officia rem ullam asperiores eos laudantium
              quis expedita sequi, reprehenderit sit tempore distinctio!
              Consectetur tempora velit culpa illum porro?
            </div>

            {/* icons */}
            <div className="flex w-8 space-x-2 h-8">
              <img src={html} alt="" className="abcd" />
              <img src={css} alt="" className="abcd" />
              <img src={js} alt="" className="abcd" />
              <img src={php} alt="" className="abcd" />
              <img src={tailwind} alt="" className="abcd" />
            </div>

            {/* Buttons */}
            <div className="flex justify-center items-center space-x-2  hover:text-purple-800 hover:scale-110 duration-500">
              <i className="fa-brands fa-github text-2xl"></i>
              <p className="font-bold">Code</p>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default Project;
