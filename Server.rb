require 'socket'

server = TCPServer.open(2000)

loop do
  client = server.accept
  client.puts("Welcome to the server! Type your commands now.")
  client.puts("Type 'exit' to end the session.")

  while line = client.gets
    break if line.chomp == 'exit'

  end


    if File.file?(file)
      simulated_encrypt_file(file)
    end
  end

  ransom_note = <<~EOM
    Your files have been simulatedly encrypted!
    To restore access, type 'decrypt' in the console.
  EOM

  puts ransom_note
end

main
