[int]$numero = Read-Host "Introduzca un número"

if ($numero % 2 -eq 0){
    Write-Host "El número introducido es par."
}else{
    Write-Host "El número introducido es impar."
}
