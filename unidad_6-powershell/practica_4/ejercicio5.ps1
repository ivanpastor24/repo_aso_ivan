[int]$numero = Read-Host "Introduzca un número para generar su tabla de multiplicar"

Write-Host "******Tabla de multiplicar del $numero******"

for ($i = 0; $i -le 10; $i++) {
     $resultado = $numero * $i
     Write-Host "$numero x $i = $resultado"
}
