require 'socket'

server = TCPServer.new('localhost', 4321)

conn = server.accept

conn.write('message from server')
puts conn.read
