/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        beige: '#f5f0e8',
        cream: '#faf8f5',
        brown: {
          50: '#faf8f5',
          100: '#f5f0e8',
          200: '#e8dfd2',
          300: '#d4c4ae',
          400: '#b8a082',
          500: '#9a8265',
          600: '#7a6650',
          700: '#5c4d3d',
          800: '#3d332a',
          900: '#1f1a15',
        },
      },
      fontFamily: {
        serif: ['LT Superior Serif', 'Georgia', 'serif'],
        sans: ['Inter', 'system-ui', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
