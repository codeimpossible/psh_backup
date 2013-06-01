# Psh Backup
A glorified, configurable file copier to backup files from one location to another.

Psh Backup (pronounced puh-shhhhhh^2) is a quick and dirty file copier that started as a weekend project to backup all my pictures, music and movies to our NAS. I wanted something that would be fast, would handle incremental and full backups, and that didn't cost anything (except time).

And thus, Psh Backup was born.

## Configuring
Specify any folders you want backed up in the `.dirs` file. This is read in by psh backup when it starts. Under the hood psh backup uses **xcopy** with these options: `/y /e /i /h /c`.

The destination folder path is stored in the `options.ps1` file in the `opt_dest_fullpath` variable. It's recommended that you only change this variable when editing the file.

## Full vs Incremental
ATM Psh Backup does a full the first time it is run and then does incrementals after that. Each time psh backup completes it writes the current date to a file named `.last`. When psh backup is run it tells xcopy to only copy files modified on or after this date. To do a full backup, just delete your `.last` file and run psh backup.
