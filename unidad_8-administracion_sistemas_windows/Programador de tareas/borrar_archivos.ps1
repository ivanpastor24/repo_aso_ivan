Get-ChildItem -Path "C:\Windows\Logs\" -Recurse | Where-Object CreationTime -LT (Get-Date).AddDays(-10) | Remove-Item
