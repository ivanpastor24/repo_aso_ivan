$usuarios = Import-Csv C:\Users\Administrador\Desktop\usuarios.csv -Delimiter ","

foreach ($trabajadores in $usuarios)
{
         Write-Host "Usuario: $($trabajadores.nombre), $($trabajadores.apellidos), $($trabajadores.grupo)"
}
