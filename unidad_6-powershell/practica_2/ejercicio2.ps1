[int]$num_1 = Read-Host "Introduzca un número"
[int]$num_2 = Read-Host "Introduzca otro número"

$suma = $num_1 + $num_2
$resta = $num_1 - $num_2
$multiplicacion = $num_1 * $num_2
$division = $num_1 / $num_2
$resto = $num_1 % $num_2

Write-Host "La suma de $num_1 y $num_2 es $suma"
Write-Host "La resta de $num_1 y $num_2 es $resta"
Write-Host "La multiplicación de $num_1 y $num_2 es $multiplicacion"
Write-Host "La división de $num_1 y $num_2 es $division"
Write-Host "El resto de $num_1 y $num_2 es $resto"
