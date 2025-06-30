const express = require("express");
const router = express.Router();
const db = require("../db");

// POST /bookings — add new customer + booking
router.post("/", async (req, res) => {
  const {
    firstName,
    lastName,
    address,
    phoneNumber,
    email,
    movieID,
    seatID,
    status,
    bookingDate,
  } = req.body;

  try {
    // 1. Insert new customer
    const [customerResult] = await db.query(
      `INSERT INTO Customer (FirstName, LastName, Address, PhoneNumber, Email)
       VALUES (?, ?, ?, ?, ?)`,
      [firstName, lastName, address, phoneNumber, email]
    );

    const customerID = customerResult.insertId;

    // 2. Insert booking
    const [bookingResult] = await db.query(
      `INSERT INTO Booking (CustomerID, ShowtimeID, SeatID, BookingDate, Status)
       VALUES (?, (SELECT ShowtimeID FROM Showtime WHERE MovieID = ? LIMIT 1), ?, ?, ?)`,
      [customerID, movieID, seatID, bookingDate, status]
    );

    // 3. Update seat availability
    await db.query(
      `UPDATE Seat SET AvailabilityStatus = 'Booked' WHERE SeatID = ?`,
      [seatID]
    );

    // 4. Return bookingID to frontend
    res.json({
      message: "Booking successful!",
      bookingID: bookingResult.insertId,
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Booking failed" });
  }
});

// ✅ 5. GET /bookings/:id — fetch full booking info for confirmation page
router.get("/:id", async (req, res) => {
  const bookingId = req.params.id;

  try {
    // Fetch booking
    const [[booking]] = await db.query(
      "SELECT * FROM Booking WHERE BookingID = ?",
      [bookingId]
    );

    // Fetch movie
    const [[movie]] = await db.query(
      "SELECT * FROM Movie WHERE MovieID = (SELECT MovieID FROM Showtime WHERE ShowtimeID = ?)",
      [booking.ShowtimeID]
    );

    // Fetch seat
    const [[seat]] = await db.query("SELECT * FROM Seat WHERE SeatID = ?", [
      booking.SeatID,
    ]);

    // Fetch customer
    const [[customer]] = await db.query(
      "SELECT * FROM Customer WHERE CustomerID = ?",
      [booking.CustomerID]
    );

    res.json({ booking, movie, seat, customer });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Error fetching booking info" });
  }
});

module.exports = router;
