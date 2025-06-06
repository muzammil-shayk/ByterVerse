const mysql = require("mysql2/promise");

// Create a connection pool
const db = mysql.createPool({
  host: "localhost", // Change if your MySQL is hosted elsewhere
  user: "root", // e.g., 'root'
  password: "Admin125",
  database: "MovieTheaterDB",
});

module.exports = db;
