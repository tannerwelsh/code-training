require 'socket'

# Socket.tcp_server_loop(4481) do |connection|
#   # The simplest way to read from a connection is with Socket#read
#   puts connection.read

#   # Close the connection when done reading. This lets the client know they don't have to keep waiting.
#   connection.close
# end


ONE_KB = 1024

#
# The above is blocking and will thus wait until a client sends an EOF
# So we can work around the problem by reading data in chunks
#
Socket.tcp_server_loop(4481) do |connection|
  # Passing an integer to IO#read tells it to only read that many bytes and return
  while data = connection.read(ONE_KB)
    s.puts data
  end

  connection.close
end

