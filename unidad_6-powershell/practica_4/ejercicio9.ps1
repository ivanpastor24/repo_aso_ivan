[string]$contraseña = Read-Host "Introduzca la contraseña correcta"

while ($contraseña -ne 'contraseña') {
       [string]$contraseña = Read-Host "Introduzca la contraseña correcta"
}

if ($contraseña -eq 'contraseña') {
    Write-Host "Contraseña correcta. Iniciando sesión..."
}
