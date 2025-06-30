import React, { useEffect, useState } from "react";
import axios from "axios";
import MovieCard from "./MovieCard";

const MoviesList = ({ searchTerm }) => {
  const [movies, setMovies] = useState([]);
  const [showtimes, setShowtimes] = useState({});
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

        const movieRes = await axios.get(url);
        const movieData = movieRes.data;
        setMovies(movieData);
        setError(null);

        // Fetch the first showtime for each movie
        const showtimeResults = await Promise.all(
          movieData.map((movie) =>
            axios
              .get(`http://localhost:3000/showtimes/movie/${movie.MovieID}`)
              .then((res) => ({
                movieId: movie.MovieID,
                showtime: res.data[0] || null,
              }))
              .catch(() => ({ movieId: movie.MovieID, showtime: null }))
          )
        );

        const showtimeMap = {};
        showtimeResults.forEach(({ movieId, showtime }) => {
          showtimeMap[movieId] = showtime;
        });

        setShowtimes(showtimeMap);
      } catch (err) {
        setError("Failed to fetch movies or showtimes.");
      } finally {
        setLoading(false);
      }
    };

    fetchMovies();
  }, [searchTerm]);

  if (loading) return <p className="text-center text-xl">Loading Movies...</p>;
  if (error) return <p className="text-center text-bittersweet">{error}</p>;
  if (movies.length === 0)
    return <p className="text-center text-dun">No Movies Found!</p>;

  return (
    <div className="px-4 py-6">
      <h2 className="text-3xl font-bold mb-6 text-dun font-pacifico text-center">
        {searchTerm ? `Showing Results for "${searchTerm}"` : "Trending Movies"}
      </h2>

      <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 xl:grid-cols-6 gap-6 justify-items-center">
        {movies.map((movie) => (
          <MovieCard
            key={movie.MovieID}
            movie={movie}
            showtime={showtimes[movie.MovieID]}
          />
        ))}
      </div>
    </div>
  );
};

export default MoviesList;
