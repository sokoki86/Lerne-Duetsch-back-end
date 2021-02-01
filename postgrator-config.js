require('dotenv').config();

module.exports = {
  "migrationDirectory": "migrations",
  "driver": "pg",
  "connectionString": process.env.DATABSE_URL,
  "ssl": process.env.NODE_ENV === "production",
}
