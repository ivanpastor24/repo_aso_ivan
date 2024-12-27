$directorio = Read-Host "Introduzca el directorio completo del fichero o carpeta"

if(Test-Path $directorio){
     Write-Host "El directorio $directorio existe."
}else{
     Write-Host "El directorio $directorio no existe."
}
