[int]$renta = Read-Host "Introduzca su renta"

if($renta -lt 10000){
    Write-Host "Su tipo impositivo es del 5%."
}elseif($renta -gt 10000 -and $renta -lt 20000){
    Write-Host "Su tipo impositivo es del 15%."
}elseif($renta -gt 20000 -and $renta -lt 35000){
    Write-Host "Su tipo impositivo es del 20%."
}elseif($renta -gt 35000 -and $renta -lt 60000){
    Write-Host "Su tipo impositivo es del 30%."
}elseif($renta -gt 60000){
    Write-Host "Su tipo impositivo es del 45%."
}
