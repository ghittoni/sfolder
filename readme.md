# sfolder, secure-folder

### Introduction
This project is meant for easy and fast encryption of folder containing sensitive data that will be uploaded on the cloud.

### Key generation
The program will create a safe key that you can use for encrypting your data, i highly recommend to store it in a password manager. If you lose your key you may look in the logs folder under the file generated_key, if not there your data are gone.

### Usage
Install zstd:

```bash
brew install zstd 
```

Create a new key and save it in a password manager. The key will also be saved automatically in the macos keychain.

```bash
./src/utils/key/init_key.sh 
```

You can enter a key if you already have one:

```bash
./src/utils/key/init_key.sh YOUR-KEY-HERE...
```

Eventually you can delete the key if something goes wrong and start the key init process again:

```bash
./src/utils/key/delete_key.sh
```

Run from project directory:

```bash
./src/encrypt.sh "folder_name"
./src/decrypt.sh "folder_name.tar.zst.enc"
```

Notes:
- Utility files (`utils/...`) are resolved from the script directory.
- Generated keys are stored in `sfolder/logs/generated_keys`.
- Input arguments keep normal shell behavior: relative paths are relative to your current directory.
