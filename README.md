# empty_directory_finder
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
