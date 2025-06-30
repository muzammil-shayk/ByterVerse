import React, { useState } from "react";
import { Link } from "react-router-dom";
function Navbar({ setSearchTerm }) {
  const [inputValue, setInputValue] = useState("");

  const handleKeyDown = (e) => {
    if (e.key === "Enter") {
      setSearchTerm(inputValue.trim());
      console.log(inputValue);
    }
  };

  return (
    <nav className="bg-smoky-black text-antiflash-white p-7">
      <div className="container mx-auto flex items-center justify-between">
        <a href="/" className="text-3xl font-bold font-pacifico cursor-pointer">
          ByterVerse
        </a>

        <div className="flex justify-center pl-36">
          <input
            type="text"
            placeholder="Search movies..."
            value={inputValue}
            onChange={(e) => setInputValue(e.target.value)}
            onKeyDown={handleKeyDown}
            className="
              w-80
              transition-width
              duration-300
              ease-in-out
              bg-jet
              placeholder-gray-400
              text-antiflash-white
              rounded-full
              px-4
              py-2
              focus:outline-dun
              focus:outline-1
              focus:w-96
              hover:w-96
            "
          />
        </div>

        <div className="space-x-6 text-xl flex items-center oswald-regular tracking-wider pr-10">
          <Link
            to="/"
            className="hover:text-dun transition-colors duration-300 ease-in-out"
          >
            Home
          </Link>
          <Link
            to="/movies"
            className="hover:text-dun transition-colors duration-300 ease-in-out"
          >
            Movies
          </Link>
          <Link
            to="/about"
            className="hover:text-dun transition-colors duration-300 ease-in-out"
          >
            About
          </Link>
        </div>
      </div>
    </nav>
  );
}

export default Navbar;
