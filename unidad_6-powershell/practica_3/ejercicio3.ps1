[int]$numero_1 = Read-Host "Introduzca un número"
[int]$numero_2 = Read-Host "Introduzca otro número"

if($numero_1 -gt $numero_2){
    Write-Host "El primer número introducido es mayor que el segundo número."
}elseif($numero_1 -lt $numero_2){
    Write-Host "El primer número introducido es menor que el segundo número."
}elseif($numero_1 -eq $numero_2){
    Write-Host "El primer número introducido es igual que el segundo número."
}
