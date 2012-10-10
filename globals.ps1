function Get-ScriptDirectory
{
  $Invocation = (Get-Variable MyInvocation -Scope 1).Value
  Split-Path $Invocation.MyCommand.Path
}

$root = Get-ScriptDirectory
$lastfile = Join-Path($root) ".last"
$configfile = Join-Path($root) ".dirs"
$logfile = Join-Path($root) ".log"

function Get-LastBackupDate
{
  $configfile = Join-Path($root) ".last"
  if( Test-Path $configfile )
  {
    $line = Get-Content -path $configfile
  } else {
      $line = "1/1/1900"
  }
  $line
}

function Out-Log($msg)
{
  Out-File -path $logfile -append -inputobject $msg
}
