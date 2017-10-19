var server = require("./server"),
    router = require("./router"),
    requestHandlers = require("./requestHandlers");

var handle = {
  "/": requestHandlers.start,
  "/start": requestHandlers.start,
  "/upload": requestHandlers.upload
}

server.start(router.route, handle);
