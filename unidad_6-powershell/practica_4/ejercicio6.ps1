[int]$numero_introducido = Read-Host "Introduzca el número a adivinar"

$numero_acertado = 24

while ($numero_introducido -ne $numero_acertado)
{
 if ($numero_introducido -lt $numero_acertado) {
     Write-Host "El número introducido es menor al número a adivinar."
     [int]$numero_introducido = Read-Host "Introduzca el número a adivinar"
 } elseif ($numero_introducido -gt $numero_acertado) {
     Write-Host "El número introducido es mayor al número a adivinar."
     [int]$numero_introducido = Read-Host "Introduzca el número a adivinar"
 }
}

if ($numero_introducido -eq $numero_acertado) {
    Write-Host "¡Enhorabuena! Usted ha acertado el número."
}
