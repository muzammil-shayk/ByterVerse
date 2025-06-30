import React, { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axios from "axios";

const BookingConfirmation = () => {
  const { bookingId } = useParams();
  const navigate = useNavigate();
  const [booking, setBooking] = useState({});
  const [movie, setMovie] = useState({});
  const [seat, setSeat] = useState({});
  const [customer, setCustomer] = useState({});

  useEffect(() => {
    axios.get(`http://localhost:3000/bookings/${bookingId}`).then((res) => {
      setBooking(res.data.booking);
      setMovie(res.data.movie);
      setSeat(res.data.seat);
      setCustomer(res.data.customer);
    });
  }, [bookingId]);

  return (
    <div className="p-6 max-w-3xl mx-auto text-white">
      <h2 className="text-2xl font-bold text-bittersweet mb-4">
        Booking Confirmed!
      </h2>
      <p className="mb-2">
        <strong>Booking ID:</strong> {bookingId}
      </p>
      <p className="mb-2">
        <strong>Movie:</strong> {movie.Title}
      </p>
      <p className="mb-2">
        <strong>Seat:</strong> {seat.SeatNumber} ({seat.RowLabel})
      </p>
      <p className="mb-2">
        <strong>Status:</strong> {booking.Status}
      </p>
      <p className="mb-4">
        <strong>Customer:</strong> {customer.FirstName} {customer.LastName}
      </p>

      <button
        onClick={() => navigate(`/payment/${bookingId}`)}
        className="bg-bittersweet text-white px-6 py-2 rounded hover:bg-hoverbittersweet"
      >
        Pay Now
      </button>
    </div>
  );
};

export default BookingConfirmation;
