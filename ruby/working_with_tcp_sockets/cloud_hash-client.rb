require 'socket'

module CloudHash
  class Client
    class << self
      attr_accessor :host, :port

      def get(key)
        request "GET #{key}"
      end

      def set(key, value)
        request "SET #{key} #{value}"
      end

      def request(str)
        @client = TCPSocket.new(host, port)
        @client.write(str)

        # Send EOF after writing string
        @client.close_write

        # Read until EOF for response
        @client.read
      end
    end
  end
end

CloudHash::Client.host = 'localhost'
CloudHash::Client.port = 4481

p CloudHash::Client.set('prez', 'obama')
p CloudHash::Client.get('prez')
p CloudHash::Client.get('vp')
