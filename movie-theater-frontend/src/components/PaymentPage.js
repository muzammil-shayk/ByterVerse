import React, { useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axios from "axios";

const PaymentPage = () => {
  const { bookingId } = useParams();
  const navigate = useNavigate();
  const [paymentMethod, setPaymentMethod] = useState("Card");
  const [amount, setAmount] = useState(800); // Default ticket price

  const handlePayment = () => {
    axios
      .post("http://localhost:3000/payments", {
        bookingID: bookingId,
        paymentMethod,
        amount,
      })
      .then(() => {
        alert("✅ Payment Successful!");
        navigate("/");
      })
      .catch((err) => {
        console.error(err);
        alert("❌ Payment failed.");
      });
  };

  return (
    <div className="p-6 max-w-md mx-auto text-white">
      <h2 className="text-2xl font-bold text-bittersweet mb-4">Payment</h2>

      <label className="block mb-2">Select Payment Method:</label>
      <select
        value={paymentMethod}
        onChange={(e) => setPaymentMethod(e.target.value)}
        className="p-2 w-full text-black rounded mb-4"
      >
        <option value="Card">Card</option>
        <option value="JazzCash">JazzCash</option>
        <option value="EasyPaisa">EasyPaisa</option>
      </select>

      <label className="block mb-2">Amount (PKR):</label>
      <input
        type="number"
        value={amount}
        onChange={(e) => setAmount(e.target.value)}
        className="p-2 w-full text-black rounded mb-4"
      />

      <button
        onClick={handlePayment}
        className="bg-bittersweet text-white px-6 py-2 rounded hover:bg-hoverbittersweet"
      >
        Confirm Payment
      </button>
    </div>
  );
};

export default PaymentPage;
