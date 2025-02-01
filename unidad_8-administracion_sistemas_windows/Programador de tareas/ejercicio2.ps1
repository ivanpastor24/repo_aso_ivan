$tmp = @("C:\Windows\Temp", "$env:TEMP")

foreach ($carpetas_temporales in $tmp) {
    Get-ChildItem -Path $carpetas_temporales -Recurse -Force | Remove-Item -Force -Recurse
}

Write-Output "Limpieza de archivos temporales completada: $(Get-Date)" | Out-File -FilePath "C:\Windows\Logs\LimpiezaTemp.log"
