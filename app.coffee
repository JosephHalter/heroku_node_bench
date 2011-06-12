mongoose = require "mongoose"
mongo_config = process.env.MONGOHQ_URL || "mongodb://127.0.0.1:27017/test"
mongoose.connect mongo_config, (err) ->
  if err
    console.log "Critical Error: cannot connect to mongo"
    process.exit 1
  else
    console.log "Connected to mongo successfully"
model = require "./models/restaurant"

express = require "express"
app = express.createServer()
restaurant = require "./controllers/restaurant"
app.use express.bodyParser()
app.post "/restaurant", restaurant.create
app.get "/restaurant/:id", restaurant.show
module.exports = app