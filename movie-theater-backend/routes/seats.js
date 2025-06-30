const express = require("express");
const router = express.Router();
const db = require("../db");

// GET /seats/showtime/:showtimeId — fetch seats for a showtime
router.get("/showtime/:showtimeId", async (req, res) => {
  const showtimeId = req.params.showtimeId;

  try {
    // Step 1: Get the TheaterID from the showtime
    const [[showtime]] = await db.query(
      "SELECT TheaterID FROM Showtime WHERE ShowtimeID = ?",
      [showtimeId]
    );

    if (!showtime) {
      return res.status(404).json({ error: "❌ Showtime not found" });
    }

    // Step 2: Get all seats for that theater
    const [seats] = await db.query(
      "SELECT * FROM Seat WHERE TheaterID = ? ORDER BY RowLabel, SeatNumber",
      [showtime.TheaterID]
    );

    res.json(seats);
  } catch (err) {
    console.error("Error fetching seats:", err);
    res.status(500).json({ error: "🔥 Server error while fetching seats" });
  }
});

module.exports = router;
