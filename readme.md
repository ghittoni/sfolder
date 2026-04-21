# sFolder

### Introduction
This project is meant for easy and fast encryption of folder containing sensitive data that will be uploaded on the cloud.

### Auto-generated key
The program will propose you an auto-generated key while encrypting, you can enter it or you can decide to use your own key.

### Storing the keys
Don't forget to store your keys, if you lose them, your files are gone forever. I highly recomment using a password manager for storing the keys

### Usage
Run from project directory:

```bash
./encrypt.sh "folder_name"
./decrypt.sh "folder_name.tar.zst.enc"
```

Run from a different directory (for example `Desktop/`):

```bash
./sfolder/encrypt.sh "./My Folder"
./sfolder/decrypt.sh "./My Folder.tar.zst.enc"
```

Absolute path example:

```bash
./sfolder/encrypt.sh "/Users/michele/Desktop/My Folder"
```

Notes:
- Utility files (`utils/...`) are resolved from the script directory.
- Generated keys are stored in `sfolder/logs/generated_keys`.
- Input arguments keep normal shell behavior: relative paths are relative to your current directory.
