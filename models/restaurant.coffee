mongoose = require "mongoose"
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

Restaurant = new Schema {
  name: String
  created_at: Date
  updated_at: Date
}

Restaurant.pre "save", (next) ->
  if(this.isNew)
    this.created_at = new Date()
  this.updated_at = new Date()
  next()

Restaurant.methods["to_json"] = ->
  JSON.stringify {id: this._id, name: this.name}

mongoose.model "Restaurant", Restaurant