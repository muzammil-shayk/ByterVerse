import React from "react";
import { Link } from "react-router-dom";

const MovieCard = ({ movie, showtime }) => {
  return (
    <div className="bg-dun shadow-md rounded-xl p-4 w-52 flex flex-col items-center justify-start text-center cursor-pointer duration-300 transform transition-transform hover:scale-105">
      {/* Movie Poster */}
      <img
        src={
          movie.PosterPath ||
          "https://via.placeholder.com/200x300?text=No+Image"
        }
        alt={movie.Title}
        className="w-full h-60 object-cover rounded-md mb-4"
      />

      {/* Movie Title */}
      <h3 className="text-lg font-anton text-bittersweet mb-1">
        {movie.Title}
      </h3>

      {/* Genre */}
      <p className="text-sm text-paynes-gray mb-1">
        <span className="font-semibold">Genre:</span> {movie.Genre}
      </p>

      {/* Rating */}
      <p className="text-sm text-paynes-gray">
        <span className="font-semibold">Rating:</span> {movie.Rating}
      </p>

      {/* Book Now Button */}
      {showtime ? (
        <div className="mt-3">
          <Link to={`/book/${movie.MovieID}/${showtime.ShowtimeID}`}>
            <button className="px-4 py-2 bg-bittersweet text-white rounded hover:bg-hoverbittersweet transition-colors duration-300 ease-in-out">
              Book Now
            </button>
          </Link>
        </div>
      ) : (
        <p className="text-xs mt-3 text-gray-500">No showtime available</p>
      )}
    </div>
  );
};

export default MovieCard;
