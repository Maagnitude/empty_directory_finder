# 1. empty_directory_finder
A bash script that finds empty directories, that are not hidden. It takes a directory as an argument, and it returns the child empty directories.

Run it on terminal like:
```bash
bash empty_directory_finder.sh <directory-name> 
```

If you first change the access permissions with:
```bash
chmod u+x empty_directory_finder.sh
```
or
```bash
chmod +x empty_directory_finder.sh
```

you can run it like:
```bash
./empty_directory_finder.sh <directory-name>
```

Note:
<directory-name>: You must also give the path to that directory, or else it won't work.

# 2. active_tcp_conns
A bash script that counts the active tcp connections of ones system, and stores them in a file "~/.tcp_connections" along with the date/hour. Also it prints them on terminal.

# 3. file_types_grouped
A bash script that takes as argument a directory, and returns the files under this directory, group by their data types.

# 4. sorting_numbers

# 5. apache_log_ipscript
