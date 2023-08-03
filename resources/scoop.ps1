$Env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

if (-Not (Get-Command 'scoop' -ErrorAction SilentlyContinue)) {
  [Environment]::SetEnvironmentVariable("SCOOP", "C:\scoop", "User")
  $Env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
  irm get.scoop.sh | iex
  scoop config autostash_on_conflict $true
}
scoop bucket add extras
scoop bucket add versions
scoop install ditto jmeter jmeter-pm keepass postman pycharm python310 terraform aws azure-cli vscode idea