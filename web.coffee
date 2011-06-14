port = parseInt(process.env.PORT || 3000);
# app = require "./app"
# app.listen port, ->
#   console.log "Listening on " + port + "..."
cluster = require "cluster"
cluster('./app').set('workers', 2).listen port, ->
  console.log "Listening on " + port + "..."