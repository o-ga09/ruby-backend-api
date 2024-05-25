# Ruby一番シンプルなWebサーバーを書いて
require 'socket'

server = TCPServer.new(8080)

loop do
    client = server.accept
    request = client.gets
    puts request

    if request.include?("/index")
        response = "HTTP/1.1 200 OK\r\n\r\nHello, World from index!"
    elsif request.include?("/")
        response = "HTTP/1.1 200 OK\r\n\r\nHello, World from root!"
    end

    client.puts response
    client.close
end
