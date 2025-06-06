import React, { useState } from "react";
import "./App.css";
import Navbar from "./components/Navbar";
import MoviesList from "./components/MoviesList";

function App() {
  const [searchTerm, setSearchTerm] = useState("");
  return (
    <div>
      <Navbar searchTerm={searchTerm} setSearchTerm={setSearchTerm} />
      <MoviesList searchTerm={searchTerm} />
    </div>
  );
}

export default App;
