<<<<<<< HEAD
﻿New-Item -Path 'C:\Empresa' -ItemType Directory

$departamentos = Import-Csv 'C:\Users\Administrador\Desktop\repo_aso_ivan\unidad_7-directorio_activo-powershell\archivos\departamentos.csv' -Delimiter ";"

foreach ($dep in $departamentos) {
      New-Item -Path C:\Empresa\"$($dep.departamento)" -ItemType Directory
}

New-SmbShare -Path 'C:\Empresa' -Name 'Empresa' -FullAccess 'Administradores' -ReadAccess 'Usuarios del dominio'

foreach ($dep in $departamentos) {
 $acl = Get-Acl -Path C:\Empresa\"$($dep.departamento)"

 $acl.SetAccessRuleProtection($true, $false)

 $acl_permisos_control_total = 'Administradores', 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow'

 $ace_permisos_control_total = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $acl_permisos_control_total

 $acl.SetAccessRule($ace_permisos_control_total)

 $ace_permisos_control_total | Format-Table

 $acl_permisos_lectura = 'Usuarios del dominio', 'Read', 'ContainerInherit, ObjectInherit', 'None', 'Allow'

 $ace_permisos_lectura = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $acl_permisos_lectura

 $acl.SetAccessRule($ace_permisos_lectura)

 $ace_permisos_lectura | Format-Table

 $acl_permisos_escritura = "$($dep.departamento)", 'Modify', 'ContainerInherit, ObjectInherit', 'None', 'Allow'

 $ace_permisos_escritura = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $acl_permisos_escritura

 $acl.SetAccessRule($ace_permisos_escritura)

 $ace_permisos_escritura | Format-Table

 $acl | Set-Acl -Path C:\Empresa\"$($dep.departamento)"
=======
﻿$ruta = "C:\Empresa"

$departamentos = "C:\Empresa\FINANZAS"
$departamentos = "C:\Empresa\PERSONAL"
$departamentos = "C:\Empresa\PRODUCCION"
$departamentos = "C:\Empresa\VENTAS"

New-Item -Path "$ruta" -ItemType Directory

New-Item -Path "$ruta\$departamentos" -ItemType Directory

New-SmbShare -Path "$ruta" -Name 'Empresa' -FullAccess Administradores -ReadAccess Todos

foreach ($departamento in $departamentos) {
   $rutadep = "$ruta\$departamento"
   
   Write-Host $rutadep
   
   $acl_departamento = Get-Acl "$rutadep"

   $acl_departamento.SetAccessRuleProtection($true,$false)

   $permiso_modificar = @("$rutadep", 'Modify', 'ContainerInherit, ObjectInherit', 'None', 'Allow')

   $ace_permiso_modificar = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_modificar

   $permiso_lectura = @('Todos', 'Read', 'ContainerInherit, ObjectInherit', 'None', 'Allow')

   $ace_permiso_lectura = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_lectura

   $permiso_control_total = @('Administradores', 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow')

   $ace_permiso_control_total = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_control_total

   $acl.SetAccessRule($ace_permiso_modificar)
   $acl.SetAccessRule($ace_permiso_lectura)
   $acl.SetAccessRule($ace_permiso_control_total)

   $acl_departamento | Set-Acl -Path "$ruta"
>>>>>>> 7a3b04bbf3137714974b1ed71fd4df40d48e6862
}
