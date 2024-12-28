[double]$nivel = Read-Host "Introduzca su puntuación"

$nivel_1 = 'Inaceptable.'
$nivel_2 = 'Aceptable.'
$nivel_3 = 'Meritorio.'

$cantidad_1 = 2400 * 0.0
$cantidad_2 = 2400 * 0.4
$cantidad_3 = 2400 * 0.6

if($nivel -eq 0.0){
     Write-Host "Su nivel de rendimiento es $nivel_1"
     Write-Host "La cantidad de dinero que usted recibirá será de $cantidad_1 €."
}elseif($nivel -eq 0.4){
     Write-Host "Su nivel de rendimiento es $nivel_2"
     Write-Host "La cantidad de dinero que usted recibirá será de $cantidad_2 €."
}elseif($nivel -ge 0.6){
     Write-Host "Su nivel de rendimiento es $nivel_3"
     Write-Host "La cantidad de dinero que usted recibirá será de $cantidad_3 €."
}
