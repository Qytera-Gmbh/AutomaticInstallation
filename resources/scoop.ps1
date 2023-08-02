if (-Not (Get-Command 'scoop' -ErrorAction SilentlyContinue)) {
  [Environment]::SetEnvironmentVariable("SCOOP", "C:\scoop", "User")
  irm get.scoop.sh | iex
  scoop config autostash_on_conflict $true
}
scoop bucket add extras
scoop bucket add versions
scoop install ditto jmeter keepass postman pycharm python310 terraform aws azure-cli vscode idea