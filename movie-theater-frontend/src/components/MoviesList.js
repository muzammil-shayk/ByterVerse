import React, { useEffect, useState } from "react";
import axios from "axios";
import MovieCard from "./MovieCard";

const MoviesList = ({ searchTerm }) => {
  const [movies, setMovies] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchMovies = async () => {
      setLoading(true);
      try {
        const url = searchTerm
          ? `http://localhost:3000/movies/search?q=${encodeURIComponent(
              searchTerm
            )}`
          : "http://localhost:3000/movies";
        const response = await axios.get(url);
        setMovies(response.data);
        setError(null);
      } catch (err) {
        setError("Failed to fetch movies");
      } finally {
        setLoading(false);
      }
    };

    fetchMovies();
  }, [searchTerm]);

  if (loading) return <p className="text-center text-xl">Loading Movies...</p>;
  if (error) return <p className="text-center text-red-500">{error}</p>;
  if (movies.length === 0)
    return (
      <p className="text-center text-antiflash-white mt-5">No Movies Found!</p>
    );

  return (
    <div className="px-4 py-6">
      {searchTerm ? (
        <h2 className="text-2xl font-semibold mb-6 font-oswald text-center text-dun tracking-wide">
          Showing Results For: <span className="italic">'{searchTerm}'</span>
        </h2>
      ) : (
        <h2 className="text-3xl font-bold mb-6 text-bittersweet font-pacifico text-center text-antiflash-white">
          Trending Movies
        </h2>
      )}

      <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 xl:grid-cols-6 gap-6 justify-items-center">
        {movies.map((movie) => (
          <MovieCard key={movie.MovieID} movie={movie} />
        ))}
      </div>
    </div>
  );
};

export default MoviesList;
