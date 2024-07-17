import React from "react";
import aboutImage from "../images/img1.jpg";

function AboutData() {
  return (
    <>
      <div className="max-w-screen min-h-screen container mx-auto md:px-10 px-4 flex justify-between items-center flex-col-reverse md:flex-row-reverse pb-10">
        {/* content section */}
        <div className="w-full md:w-1/2 mt-12 md:mt-32 md:p-0 p-8">
          <div className="space-y-3">
            <h1 className="md:text-3xl text-2xl font-bold text-purple-800 mb-8">
              About Me
            </h1>

            <h1 className="md:text-2xl text-xl font-semibold">
              A Dedicated Fullstack Developer based in Surat, Gujarat{" "}
            </h1>

            <h1 className="md:text-xl text-lg  ">
              <div className="text-slate-600 text-justify">
                {" "}
                As a Full-Stack Developer, I specialize in React.js, Next.js,
                Node.js, and PHP, complemented by skills in MongoDB, MySQL,
                Tailwind CSS, and Bootstrap. My proficiency extends from
                crafting dynamic and responsive front-end interfaces to building
                scalable client-server-side applications. Committed to writing
                clean, optimized code, I collaborate seamlessly with
                cross-functional teams, ensuring the delivery of outstanding web
                applications that provide a compelling user experience.{" "}
              </div>
            </h1>
          </div>
        </div>

        {/* Image section */}
        <div className="w-full md:w-1/2 h-full flex  ">
          <div className="md:p-0 p-8">
            <img
              src={aboutImage}
              className="md:h-[400px] md:w-[500px] mt-12 md:mt-32 rounded-xl shadow-lg shadow-slate-700"
              alt="profileImage"
            />
          </div>
        </div>
      </div>
    </>
  );
}

export default AboutData;
