require 'socket'

s = TCPServer.new(3939)
while conn = s.accept
  puts "New connection: #{conn}"
  Thread.new(conn) do |c|
    puts "New thread for #{c}"
    c.print "Hi, what's your name?"
    name = c.gets.chomp
    c.puts "Hi #{name}, here's the date."
    c.puts `date`
    c.close
  end
end
