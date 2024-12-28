[int]$edad = Read-Host "Introduzca su edad"

$precio_1 = 'gratuito.'
$precio_2 = '5 €.'
$precio_3 = '10 €.'

if($edad -lt 4){
     Write-Host "El precio de la entrada para usted es $precio_1"
}elseif($edad -ge 4 -and $edad -le 18){
     Write-Host "El precio de la entrada para usted es de $precio_2"
}elseif($edad -gt 18){
     Write-Host "El precio de la entrada para usted es de $precio_3"
}
