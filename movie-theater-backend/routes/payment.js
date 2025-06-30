const express = require("express");
const router = express.Router();
const db = require("../db");

// POST /payments — handle payment and update booking status
router.post("/", async (req, res) => {
  const { bookingID, amount, paymentMethod } = req.body;

  try {
    // 1. Insert payment record
    await db.query(
      `INSERT INTO Payment (BookingID, Amount, PaymentMethod, PaymentDate)
       VALUES (?, ?, ?, CURDATE())`,
      [bookingID, amount, paymentMethod]
    );

    // 2. Update booking status
    await db.query(
      `UPDATE Booking SET Status = 'Confirmed' WHERE BookingID = ?`,
      [bookingID]
    );

    res.json({ message: "✅ Payment successful!" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "❌ Payment failed." });
  }
});

module.exports = router;
