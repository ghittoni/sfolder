function standout_message() {
    for i in {1..50}; do printf '-'; done; echo
    echo $1
    for i in {1..50}; do printf '-'; done; echo
}