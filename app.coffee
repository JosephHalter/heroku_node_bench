mongoose = require "mongoose"
mongoose.connect "127.0.0.1", "test", 27017, (err) ->
  if err
    console.log "Critical Error: cannot connect to mongo on port 27017"
    process.exit 1
  else
    console.log "Connected to mongo on port 27017"
model = require "./models/restaurant"

express = require "express"
app = express.createServer()
restaurant = require "./controllers/restaurant"
# app.use express.logger()
app.use express.bodyParser()
app.post "/restaurant", restaurant.create
app.get "/restaurant/:id", restaurant.show
module.exports = app