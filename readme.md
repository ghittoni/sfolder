# sfolder, secure-folder

### Introduction
This project is meant for easy and fast encryption of folder containing sensitive data that will be uploaded on the cloud.

### Key generation
The program will create a safe key that you can use fro encrypting your data, i highly recommend to store it in a password manager. If you lose your key you may look in the logs folder under the file generated_key, if not there your data are gone.

### Usage
Install zstd:

```bash
brew install zstd 
```

Create a key and save it in a password manager:

```bash
key_generator.sh 
```

Run from project directory:

```bash
encrypt.sh "folder_name"
decrypt.sh "folder_name.tar.zst.enc"
```

Run from a different directory (for example `Desktop/`):

```bash
sfolder/encrypt.sh "My Folder"
sfolder/decrypt.sh "My Folder.tar.zst.enc"
```

Notes:
- Utility files (`utils/...`) are resolved from the script directory.
- Generated keys are stored in `sfolder/logs/generated_keys`.
- Input arguments keep normal shell behavior: relative paths are relative to your current directory.
