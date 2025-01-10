[string]$nombre = Read-Host "Introduzca su nombre"
[int]$numero_repeticiones = Read-Host "Introduzca un número para repetir por líneas su nombre"

for ($i = 1; $i -le $numero_repeticiones; $i++)
{
     Write-Host $nombre
}
