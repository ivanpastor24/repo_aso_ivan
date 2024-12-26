[int]$edad = Read-Host "Introduzca su edad"

if($edad -lt 18){
    Write-Host "Usted es menor de edad."
}else{
    Write-Host "Usted es mayor de edad."
}
