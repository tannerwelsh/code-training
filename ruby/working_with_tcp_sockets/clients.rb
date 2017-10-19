require 'socket'

#
# Create a new socket and connect to a remote server on port 80
#
# client = Socket.new(:INET, :STREAM)
# remote_addr = Socket.pack_sockaddr_in(80, 'google.com')
# socket.connect(remote_addr)

#
# The above can be done more simply with the wrapper class
#
client = TCPSocket.new('google.com', 80)
