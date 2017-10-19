require 'socket'

server = Socket.new(:INET, :STREAM)

addr = Socket.pack_sockaddr_in(4481, '127.0.0.1')

server.bind(addr)
server.listen(5)

server.setsockopt(:SOCKET, :REUSEADDR, true)
p server.getsockopt(:SOCKET, :REUSEADDR).bool

Socket.accept_loop(server) do |connection|
  p connection.read(5)
  connection.write('message recieved')
  p connection.read(4)
  connection.write('pending message')
  connection.close
end
