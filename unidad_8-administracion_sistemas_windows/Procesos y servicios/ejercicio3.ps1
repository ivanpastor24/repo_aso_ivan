$usuario = Read-Host "Introduzca un nombre de usuario (Ejemplo: EMPRESA\Usuario)"

Get-WmiObject Win32_Process | Where-Object { $_.GetOwner().User -eq $usuario } | ForEach-Object { Stop-Process -Id $_.ProcessId -Force }

Write-Host "Todos los procesos del usuario $usuario han sido finalizados."
