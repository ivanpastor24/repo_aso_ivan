$ruta = "C:\Empresa"

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
}
