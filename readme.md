# sfolder, secure-folder

### Introduction
This project provides quick, simple encryption for folders containing sensitive data that will be uploaded to the cloud.

### Key generation
The program will create a secure key that you can use to encrypt your data. I highly recommend storing it in a password manager. If you lose your key, you can check the macOS Keychain app under `sfolder`; if it’s not there, your data is gone.

### Usage
Install zstd:

```bash
brew install zstd
```

Create a new key and save it in a password manager. The key will also be saved automatically in the macOS Keychain.

```bash
./src/utils/key/init_key.sh
```

You can enter a key if you already have one:

```bash
./src/utils/key/init_key.sh YOUR-KEY-HERE...
```

If needed, you can delete the key from the Keychain if something goes wrong and start the key init process again:

```bash
./src/utils/key/delete_key.sh
```

Run from the project directory:

```bash
./src/encrypt.sh "folder_name"
./src/decrypt.sh "folder_name.tar.zst.enc"
```

Notes:
- Utility files (`utils/...`) are resolved from the script directory.
- Input arguments keep normal shell behavior: relative paths are relative to your current directory.
