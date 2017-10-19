require 'socket'

socket = Socket.new(:INET, :STREAM)

opt = socket.getsockopt(:SOCKET, :TYPE)
opt.family
opt.level
opt.optname
opt.data
