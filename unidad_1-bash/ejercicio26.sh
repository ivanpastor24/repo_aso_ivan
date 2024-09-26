
#!/bin/bash

find / -type f -perm 007 2>/dev/null > peligroso_files.txt
