# DO NOT CHANGE THIS VALUE
$opt_dest_foldername = (Get-Date).tostring() -replace "[:\s/]", "_"

# YOU CAN CHANGE THIS VALUE TO POINT THE BACKUPS
# TO ANOTHER LOCATION LIKE A UNC OR LOCAL PATH
$opt_dest_fullpath = "\\remote_server\folder\$opt_dest_foldername"
