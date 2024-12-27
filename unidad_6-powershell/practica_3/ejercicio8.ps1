$nombre = Read-Host "Introduzca su nombre"
$sexo = Read-Host "Introduzca su sexo (hombre/mujer)"

if(($sexo -eq 'mujer' -and $nombre -lt 'M') -or ($sexo -eq 'hombre' -and $nombre -gt 'N')){
      $grupo = 'A'
      Write-Host "Usted pertenece al grupo $grupo."
}else{
      $grupo = 'B'
      Write-Host "Usted pertenece al grupo $grupo."
}
