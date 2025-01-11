[int]$numero = Read-Host "Introduzca un número para generar un triángulo rectángulo"

for ($fila = 1; $fila -le $numero; $fila++)
{    for ($columna = $fila; $columna -ge 1; $columna--)
     {    
          Write-Host -NoNewLine "$(($columna * 2) - 1)"
     }
          Write-Host ""
}
