require 'socket'

#
# Set up a basic server
#
# server = Socket.new(:INET, :STREAM)
# addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
# server.bind(addr)
# server.listen(128)

#
# Simple accept loop
#
# loop do
  # connection, _ = server.accept
  # Process connection
  # connection.close
# end

#
# Connections can be copied
#
# connection, _ = server.accept
# copy = connection.dup
# connection.shutdown
# connection.close

#
# TCPServer.new(4481) is a wrapper for this:
#
# server = Socket.new(:INET, :STREAM)
# addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
# server.bind(addr)
# server.listen(5)

#
# This returns two TCP sockets, one that can be reached via IPv6 and another at IPv4
#
# servers = Socket.tcp_server_sockets(4481)

#
# Enter an endless loop of accepting and handling connections
#
# Socket.accept_loop(servers) do |connection|
#   connection.puts "hi there"
#   STDOUT.puts connection.gets
#   connection.close
# end

#
# This does exactly the same as above, but packed into one method
#
Socket.tcp_server_loop(4481) do |connection|
  connection.puts "hi there"
  STDOUT.puts connection.gets
  connection.close
end
