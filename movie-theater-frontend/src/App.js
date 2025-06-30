import React, { useState } from "react";
import { Routes, Route } from "react-router-dom";
import "./App.css";
import Navbar from "./components/Navbar";
import MoviesList from "./components/MoviesList";
import BookingPage from "./components/BookingPage";
import BookingConfirmation from "./components/BookingConfirmation";
import PaymentPage from "./components/PaymentPage";

function App() {
  const [searchTerm, setSearchTerm] = useState("");

  return (
    <div>
      <Navbar searchTerm={searchTerm} setSearchTerm={setSearchTerm} />
      <Routes>
        <Route path="/" element={<MoviesList searchTerm={searchTerm} />} />
        <Route path="/book/:movieId/:showtimeId" element={<BookingPage />} />
        <Route
          path="/confirmation/:bookingId"
          element={<BookingConfirmation />}
        />
        <Route path="/payment/:bookingId" element={<PaymentPage />} />
      </Routes>
    </div>
  );
}

export default App;
