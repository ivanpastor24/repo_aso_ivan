$valor_contraseña = Read-Host "Introduzca la contraseña"

$contraseña = 'aso'

if($valor_contraseña -eq $contraseña){
    Write-Host "La contraseña introducida es correcta. Iniciando sesión..."
}else{
    Write-Host "La contraseña introducida no es correcta. Vuelva a intentarlo de nuevo."
}
