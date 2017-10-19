require 'socket'

PORT_RANGE = 1..1024
HOST = 'twitter.com'
TIME_TO_WAIT = 10

# Create a socket for each port and initiate the nonblocking connect
sockets = PORT_RANGE.map do |port|
  socket = Socket.new(:INET, :STREAM)
  remote_addr = Socket.sockaddr_in(port, HOST)

  begin
    socket.connect_nonblock(remote_addr)
  rescue Errno::EINPROGRESS
  end

  socket
end

# Set the expiration
expiration = Time.now + TIME_TO_WAIT

loop do
  # Call IO.select and adjust the timeout so that it never waits beyond the expiration
  _, writeable, _ = IO.select(nil, sockets, nil, expiration - Time.now)
  break unless writeable

  writeable.each do |socket|
    begin
      socket.connect_nonblock(socket.remote_address)
    rescue Errno::EISCONN
      # If socket is already connected count this as a success
      puts "#{HOST}:#{socket.remote_address.ip_port} accepts connections..."
      # Remove socket from list so it doesn't continue to be selected as writeable
      sockets.delete(socket)
    rescue Errno::EINVAL
      sockets.delete(socket)
    end
  end
end
