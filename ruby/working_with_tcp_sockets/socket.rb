require 'socket'

# Create a socket with the protocol INET (ipv4) and type STREAM
socket = Socket.new(:AF_INET, :SOCK_STREAM)

# Get an address with port
addr = Socket.pack_sockaddr_in(4481, '127.0.0.1')

# Bind the socket
socket.bind(addr)

# Listen for connections with a socket queue of 5
socket.listen(5)

connection, _ = socket.accept

print 'Connection class: '
p connection.class
print 'Server fileno: '
p socket.fileno
print 'Connection fileno: '
p connection.fileno
print 'Local address: '
p connection.local_address
print 'Remote address: '
p connection.remote_address

# This will error out because we can't bind two sockets to the same address
# Socket.new(:AF_INET, :SOCK_STREAM).bind(addr)

# ------------

# This socket will bind to the loopback interface and will
# only be listening for clients from localhost.
# local_socket = Socket.new(:INET, :STREAM)
# local_addr = Socket.pack_sockaddr_in(4481, '127.0.0.1')
# local_socket.bind(local_addr)

# This socket will bind to any of the known interfaces and
# will be listening for any client that can route messages
# to it.
# any_socket = Socket.new(:INET, :STREAM)
# any_addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
# any_socket.bind(any_addr)

# This socket attempts to bind to an unkown interface
# and raises Errno::EADDRNOTAVAIL.
# error_socket = Socket.new(:INET, :STREAM)
# error_addr = Socket.pack_sockaddr_in(4481, '1.2.3.4')
# error_socket.bind(error_addr)
