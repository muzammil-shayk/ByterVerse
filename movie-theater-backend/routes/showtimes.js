const express = require("express");
const router = express.Router();
const db = require("../db");

// GET /showtimes/movie/:movieId
router.get("/movie/:movieId", async (req, res) => {
  const movieId = req.params.movieId;
  try {
    const [rows] = await db.query(
      `SELECT * FROM Showtime WHERE MovieID = ? ORDER BY ShowDate ASC, ShowTime ASC`,
      [movieId]
    );

    if (rows.length === 0) {
      return res
        .status(404)
        .json({ message: "No showtimes found for this movie." });
    }

    res.json(rows); // returns array of showtimes
  } catch (err) {
    console.error("Error fetching showtimes:", err);
    res.status(500).json({ error: "Database error" });
  }
});

module.exports = router;
