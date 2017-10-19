require 'socket'

client = TCPSocket.new('localhost', 4321)

client.write('message from client')
client.close_write
puts client.read
client.close
