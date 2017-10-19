require 'socket'

module CloudHash
  class Server
    def initialize(port)
      @server = TCPServer.new('localhost', port)
      puts "Listening on port #{@server.local_address.ip_port}"

      @storage = Hash.new
    end

    def start
      Socket.accept_loop(@server) do |connection|
        handle(connection)
        connection.close
      end
    end

    def handle(connection)
      request = connection.read

      connection.write process(request)
    end

    def process(request)
      command, key, value = request.split

      case command.upcase
      when 'GET'
        @storage[key]
      when 'SET'
        @storage[key] = value
      end
    end
  end
end

CloudHash::Server.new(4481).start
