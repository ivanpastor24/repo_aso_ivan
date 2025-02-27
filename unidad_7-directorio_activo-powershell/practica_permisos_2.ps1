New-Item -Path 'C:\Empresa' -ItemType Directory

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
}
