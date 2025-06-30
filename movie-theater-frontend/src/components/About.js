import React from "react";

const About = () => {
  return (
    <div className="min-h-screen bg-smoky-black text-antiflash-white p-6 flex flex-col items-center justify-center">
      <img
        src="https://res.cloudinary.com/dgmsptsr9/image/upload/v1751307653/PHOTO-2025-06-30-23-19-33_uhhpkr.jpg"
        alt="Byters Logo"
        className="w-36 h-36 rounded-full object-cover object-center mx-auto mb-6 shadow-lg border-4 border-bittersweet transition-all duration-500 ease-in-out transform hover:scale-105 hover:rotate-1"
      />
      <h1 className="text-3xl font-bold mb-2 text-bittersweet">
        M. Muzammil (Co-Founder: BYTERS)
      </h1>
      <p className="mb-6 italic text-gray">
        This project was done as a 4th semester final term Database System
        subject.
      </p>

      <div className="space-y-3 text-center">
        <p>
          <span className="font-semibold text-dun">Email:</span>{" "}
          <a
            href="mailto:thehifivesquad@proton.me"
            className="text-bittersweet underline hover:text-hoverbittersweet"
          >
            thehifivesquad@proton.me
          </a>
        </p>
        <p>
          <span className="font-semibold text-dun">GitHub:</span>{" "}
          <a
            href="https://github.com/muzammil-shayk"
            target="_blank"
            rel="noopener noreferrer"
            className="text-bittersweet underline hover:text-hoverbittersweet"
          >
            github.com/muzammil-shayk
          </a>
        </p>
        <p>
          <span className="font-semibold text-dun">Instagram:</span>{" "}
          <a
            href="https://www.instagram.com/bytercrew"
            target="_blank"
            rel="noopener noreferrer"
            className="text-bittersweet underline hover:text-hoverbittersweet"
          >
            @bytercrew
          </a>
        </p>
      </div>

      <div className="mt-10 text-sm text-gray italic">BYTERS Pvt. Ltd</div>
    </div>
  );
};

export default About;
