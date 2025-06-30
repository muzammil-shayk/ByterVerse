const express = require("express");
const cors = require("cors");
const moviesRouter = require("./routes/movies");
const seatsRouter = require("./routes/seats");
const bookingRouter = require("./routes/booking");
const showtimesRouter = require("./routes/showtimes");
const paymentRouter = require("./routes/payment");

const app = express(); //init express
const PORT = 3000;
app.use(cors());
app.use(express.json()); //convert sql data into json format
// Basic test route
app.get("/", (req, res) => {
  res.send("Backend is running");
});
app.use("/movies", moviesRouter);
app.use("/seats", seatsRouter);
app.use("/bookings", bookingRouter);
app.use("/showtimes", showtimesRouter);
app.use("/payments", paymentRouter);
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
