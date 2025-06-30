import React, { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axios from "axios";

const BookingPage = () => {
  const { movieId, showtimeId } = useParams();
  const navigate = useNavigate();
  const [movie, setMovie] = useState({});
  const [seats, setSeats] = useState([]);
  const [selectedSeatId, setSelectedSeatId] = useState(null);

  // Customer Info
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [phoneNumber, setPhoneNumber] = useState("");
  const [email, setEmail] = useState("");
  const [address, setAddress] = useState("");

  // Load movie and seat data
  useEffect(() => {
    // Load movie details
    axios
      .get(`http://localhost:3000/movies/${movieId}`)
      .then((res) => setMovie(res.data))
      .catch((err) => console.error("Error fetching movie:", err));

    // Load seats either by showtimeId or fallback showtime
    const loadSeats = async () => {
      try {
        let activeShowtimeId = showtimeId;

        if (!showtimeId) {
          const res = await axios.get(
            `http://localhost:3000/showtimes/movie/${movieId}`
          );
          activeShowtimeId = res.data[0]?.ShowtimeID;
          if (!activeShowtimeId) {
            return alert("No showtime found for this movie.");
          }
        }

        const seatRes = await axios.get(
          `http://localhost:3000/seats/showtime/${activeShowtimeId}`
        );
        setSeats(seatRes.data);
      } catch (err) {
        console.error("Error fetching seats:", err);
      }
    };

    loadSeats();
  }, [movieId, showtimeId]);

  // Group seats by row
  const groupedSeats = seats.reduce((acc, seat) => {
    if (!acc[seat.RowLabel]) acc[seat.RowLabel] = [];
    acc[seat.RowLabel].push(seat);
    return acc;
  }, {});

  // Submit booking
  const handleBooking = () => {
    if (
      !firstName ||
      !lastName ||
      !phoneNumber ||
      !email ||
      !address ||
      !selectedSeatId
    ) {
      return alert("Please fill in all fields and select a seat.");
    }

    axios
      .post("http://localhost:3000/bookings", {
        firstName,
        lastName,
        address,
        phoneNumber,
        email,
        movieID: movieId,
        showtimeID: showtimeId,
        seatID: selectedSeatId,
        status: "Confirmed",
        bookingDate: new Date().toISOString().split("T")[0],
      })
      .then((res) => {
        const bookingID = res.data.bookingID;
        navigate(`/confirmation/${bookingID}`);
      })
      .catch((err) => {
        console.error("Booking error:", err);
        alert("❌ Booking failed. Please try again.");
      });
  };

  return (
    <div className="p-6 max-w-3xl mx-auto text-white">
      <h2 className="text-2xl font-bold mb-4 text-bittersweet">
        Book: {movie.Title}
      </h2>

      <img
        src={movie.PosterPath}
        alt={movie.Title}
        className="w-52 mb-4 rounded"
      />
      <p className="mb-2">
        <strong>Genre:</strong> {movie.Genre}
      </p>
      <p className="mb-2">
        <strong>Language:</strong> {movie.Language}
      </p>
      <p className="mb-6">
        <strong>Duration:</strong> {movie.Duration} mins
      </p>

      {/* Customer Info */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
        <input
          type="text"
          placeholder="First Name"
          value={firstName}
          onChange={(e) => setFirstName(e.target.value)}
          className="p-2 border rounded text-black"
        />
        <input
          type="text"
          placeholder="Last Name"
          value={lastName}
          onChange={(e) => setLastName(e.target.value)}
          className="p-2 border rounded text-black"
        />
        <input
          type="text"
          placeholder="Phone Number"
          value={phoneNumber}
          onChange={(e) => setPhoneNumber(e.target.value)}
          className="p-2 border rounded text-black"
        />
        <input
          type="email"
          placeholder="Email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          className="p-2 border rounded text-black"
        />
        <input
          type="text"
          placeholder="Address"
          value={address}
          onChange={(e) => setAddress(e.target.value)}
          className="p-2 border rounded text-black md:col-span-2"
        />
      </div>

      {/* Seat Selection */}
      {seats.length === 0 ? (
        <p className="text-center text-gray-300">No seats available.</p>
      ) : (
        Object.keys(groupedSeats).map((row) => (
          <div key={row} className="mb-4">
            <h4 className="font-semibold mb-1">Row {row}</h4>
            <div className="flex gap-3 flex-wrap">
              {groupedSeats[row].map((seat) => (
                <button
                  key={seat.SeatID}
                  disabled={seat.AvailabilityStatus === "Booked"}
                  onClick={() => setSelectedSeatId(seat.SeatID)}
                  className={`px-4 py-2 rounded ${
                    seat.AvailabilityStatus === "Booked"
                      ? "bg-gray-400 cursor-not-allowed"
                      : selectedSeatId === seat.SeatID
                      ? "bg-bittersweet text-white"
                      : "bg-dun hover:bg-bittersweet"
                  }`}
                >
                  {seat.SeatNumber}
                </button>
              ))}
            </div>
          </div>
        ))
      )}

      {/* Confirm Button */}
      <button
        className="bg-bittersweet text-white px-6 py-2 rounded hover:bg-hoverbittersweet mt-6"
        onClick={handleBooking}
        disabled={!selectedSeatId}
      >
        Confirm Booking
      </button>
    </div>
  );
};

export default BookingPage;
