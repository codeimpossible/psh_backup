#### LOAD GLOBAL METHODS/VARIABLES
. .\globals.ps1

#### LOAD CONFIGURATION OPTIONS
. .\options.ps1

function New-BackUpFolder
{
  $null = New-Item -path $opt_dest_fullpath -itemType directory
}

function Do-Backup ($x)
{
  Write-Host "Creating destination folder..."
  New-BackUpFolder

  Write-Host "Getting files list for $x..."
  $lastbackup = Get-LastBackupDate

  $dest_dir = $x -replace "[:\s\\/]", "_"

  #cheat
  xcopy $x "$opt_dest_fullpath\$dest_dir" /s /d:$lastbackup /y /e /i /h /c
}

function Do-Done
{
  $date = Get-Date
  Out-File -filepath $lastfile -inputobject $date.ToShortDateString()
}

try {
  $reader = [System.IO.File]::OpenText( $configfile )
  for(;;) {
      $line = $reader.ReadLine()
      if ($line -eq $null) { break }
      # process the line
      Do-Backup($line)
  }
  Do-Done
}
finally {
    $reader.Close()
}
