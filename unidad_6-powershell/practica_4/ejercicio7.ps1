[int]$numero = Read-Host "Introduzca un número para generar un triángulo rectángulo"

for ($fila = 1; $fila -le $numero; $fila++)
{    for ($columna = 1; $columna -le $fila; $columna++)
     {    
          Write-Host -NoNewLine "*"
     }
          Write-Host ""
}
