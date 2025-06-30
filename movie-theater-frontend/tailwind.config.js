/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}", // adjust paths to your source files
  ],
  theme: {
    extend: {
      fontFamily: {
        anton: ['"Anton"', "sans-serif"],
        pacifico: ['"Pacifico"', "cursive"],
      },
      colors: {
        bittersweet: "#EB5E28",
        hoverbittersweet: "#a83b10",
        "smoky-black": "#14110f",
        jet: "#34312d",
        gray: "#7e7f83",
        browngray: "#403D39",
        dun: "#d9c5b2",
        "antiflash-white": "#f3f3f4",
      },
    },
  },
  plugins: [],
};
