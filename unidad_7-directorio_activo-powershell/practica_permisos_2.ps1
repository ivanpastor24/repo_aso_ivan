$ruta = "C:\Empresa\"
$departamentos = @("FINANZAS","PERSONAL","PRODUCCION","VENTAS")

New-Item -Path $ruta -ItemType Directory

foreach ($departamento in $departamentos) {
   New-Item "$ruta\$departamento" -ItemType Directory -Force
}

New-SmbShare -Name "Empresa" -Path $ruta -FullAccess Administradores -ReadAccess Todos -Force

foreach ($departamento in $departamentos) {
   New-SmbShare -Name $departamento -Path "$ruta\$departamento" -FullAccess Administradores -ReadAccess Todos -Force
}

foreach ($departamento in $departamentos) {
   $departamento = "$ruta\$departamento"
   $acl_departamento = Get-Acl $departamento

   $permiso_modificar = @('$ruta\$departamento', 'Modify', 'Container.Inherit, ObjectInherit','$departamento', 'Allow')

   $ace_permiso_modificar = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_modificar

   $permiso_lectura = @('$ruta\$departamento', 'Read', 'Container.Inherit, ObjectInherit', 'Todos', 'Allow')

   $ace_permiso_lectura = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_lectura

   $permiso_control_total = @('$ruta\$departamento', 'FullControl', 'Container.Inherit, ObjectInherit', 'Administradores', 'Allow')

   $ace_permiso_control_total = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_control_total

   $acl.SetAccessRule($ace_permiso_modificar, $ace_permiso_lectura, $ace_permiso_control_total)

   $acl_departamento | Set-Acl -Path $ruta
}
