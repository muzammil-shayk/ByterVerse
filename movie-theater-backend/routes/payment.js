router.post("/", async (req, res) => {
  const { bookingID, paymentMethod, amount } = req.body;

  try {
    // Insert payment
    await db.query(
      `INSERT INTO Payment (BookingID, PaymentMethod, PaymentDate, Amount, Status)
       VALUES (?, ?, CURDATE(), ?, 'Paid')`,
      [bookingID, paymentMethod, amount]
    );

    // Update booking status to Confirmed
    await db.query(
      `UPDATE Booking SET Status = 'Confirmed' WHERE BookingID = ?`,
      [bookingID]
    );

    res.json({ message: "Payment successful and booking confirmed!" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Payment failed" });
  }
});
