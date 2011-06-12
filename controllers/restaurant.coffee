mongoose = require "mongoose"
Restaurant = mongoose.model "Restaurant"

module.exports = {
  create: (req, res) ->
    restaurant = new Restaurant()
    restaurant.name = req.body.name
    restaurant.save (err) ->
      if err
        console.log "save failed"
        console.log err
        res.send "Saved failed", {}, 500
      else
        res.send restaurant.to_json(), {'Content-Type': 'application/json'}, 201
  show: (req, res) ->
    Restaurant.findById req.params.id, (err, restaurant) ->
      if restaurant
        res.send restaurant.to_json(), {'Content-Type': 'application/json'}, 200
      else
        res.send 404
}