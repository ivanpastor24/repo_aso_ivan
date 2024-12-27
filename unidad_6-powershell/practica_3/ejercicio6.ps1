$directorio = Read-Host "Introduzca el directorio completo del fichero o carpeta"

if(Test-Path $directorio){
     Get-ChildItem -Path $directorio -Recurse
}else{
     Write-Host "El directorio $directorio no existe."
}
