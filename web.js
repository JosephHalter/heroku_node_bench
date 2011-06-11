var http = require('http');

var app = http.createServer(function(request, response){
  request.addListener('end', function(){
    response.writeHeader(200, {
      'Content-Type': 'text/plain'
    });
    response.write('Hello world!');
    response.end();
  });
});
var port = process.env.PORT || 3000;
app.listen(port, function(){
  console.log("Listening on " + port);
});