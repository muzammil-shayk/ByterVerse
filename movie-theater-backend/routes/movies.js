const express = require("express");
const router = express.Router();
const db = require("../db");

// GET /movies — get all movies
router.get("/", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM Movie");
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Database error" });
  }
});

// Search movies by title or genre
router.get("/search", async (req, res) => {
  const searchTerm = req.query.q;
  if (!searchTerm) {
    return res
      .status(400)
      .json({ error: "Missing search query parameter 'q'" });
  }
  try {
    const [rows] = await db.query(
      `SELECT * FROM Movie WHERE Title LIKE ? OR Genre LIKE ?`,
      [`%${searchTerm}%`, `%${searchTerm}%`]
    );
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Database error" });
  }
});

router.get("/:id", async (req, res, next) => {
  const movieId = req.params.id;
  try {
    const [result] = await db.query("select * from movie where MovieID = ?", [
      movieId,
    ]);
    if (result.length === 0) {
      return res.status(404).json({ message: "Movie Not Found." });
    }
    res.json(result[0]);
  } catch (err) {
    next(err);
  }
});
module.exports = router;
