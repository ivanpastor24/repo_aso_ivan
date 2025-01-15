$usuarios = Import-Csv C:\Users\Administrador\Desktop\repo_aso_ivan\unidad_6-powershell\practica_5\usuarios.csv -Delimiter ","

foreach ($trabajadores in $usuarios)
{
         Write-Host "Usuario: $($trabajadores.nombre), $($trabajadores.apellidos), $($trabajadores.grupo)"
}
