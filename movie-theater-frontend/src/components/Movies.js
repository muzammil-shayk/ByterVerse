// src/pages/Movie.js
import React, { useEffect, useState } from "react";
import axios from "axios";
import MovieCard from "../components/MovieCard";

const Movie = () => {
  const [movies, setMovies] = useState([]);
  const [showtimesMap, setShowtimesMap] = useState({});

  useEffect(() => {
    // Fetch all movies
    axios.get("http://localhost:3000/movies").then((res) => {
      const movieList = res.data;
      setMovies(movieList);

      // For each movie, fetch its first showtime
      const showtimePromises = movieList.map((movie) =>
        axios
          .get(`http://localhost:3000/showtimes/movie/${movie.MovieID}`)
          .then((res) => ({ movieId: movie.MovieID, showtime: res.data[0] }))
          .catch(() => ({ movieId: movie.MovieID, showtime: null }))
      );

      Promise.all(showtimePromises).then((results) => {
        const map = {};
        results.forEach(({ movieId, showtime }) => {
          map[movieId] = showtime;
        });
        setShowtimesMap(map);
      });
    });
  }, []);

  return (
    <div className="px-4 py-6">
      <h2 className="text-3xl font-bold mb-6 text-dun font-pacifico text-center">
        Explore All Movies
      </h2>
      <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 xl:grid-cols-6 gap-6 justify-items-center">
        {movies.map((movie) => (
          <MovieCard
            key={movie.MovieID}
            movie={movie}
            showtime={showtimesMap[movie.MovieID]}
          />
        ))}
      </div>
    </div>
  );
};

export default Movie;
