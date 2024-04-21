# Remote Access Trojan (RAT) and Ransomware Simulation Tools

This repository contains examples of a Remote Access Trojan (RAT) and a ransomware simulation tool, implemented in Ruby. These tools are meant for educational purposes only and do not contain any malicious functionality.

## Remote Access Trojan (RAT)

The RAT consists of a server and a client implemented in Ruby. The server accepts incoming connections and allows the client to execute commands on the server's machine.

### How to run the RAT

1. Start the server by running `ruby server.rb` in a terminal window.
2. In a separate terminal window, run the client using `ruby client.rb`.
3. Type your commands in the client terminal and press Enter.
4. Type 'exit' to end the session.

## Ransomware Simulation

The ransomware simulation tool is a Ruby script that takes a directory path as an argument and "encrypts" all files within the directory and its subdirectories by creating copies of the files with a different extension. This tool doesn't actually encrypt the files but simulates the encryption process.

### How to run the ransomware simulation

1. Run the ransomware simulation tool using `ruby ransomware.rb` followed by the directory path you want to simulate encryption for.
2. The tool will display simulated encryption messages for each file.

## Warning

These tools are for educational purposes only. Using them for malicious intent is illegal and unethical. Always follow the terms of service and respect the rules of any platform you use.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
