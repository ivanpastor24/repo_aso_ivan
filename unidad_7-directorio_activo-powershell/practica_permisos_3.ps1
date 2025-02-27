New-Item -Path C:\Empresa_users -ItemType Directory

$empleados = Import-Csv 'C:\Users\Administrador\Desktop\repo_aso_ivan\unidad_7-directorio_activo-powershell\archivos\empleados.csv' -Delimiter ";"

foreach ($emp in $empleados) {
   New-Item -Path C:\Empresa_users\"$($emp.nombre).$($emp.apellido)" -ItemType Directory
}

New-SmbShare -Path C:\Empresa_users -Name Empresa_users$ -FullAccess 'Administradores' -ReadAccess 'Usuarios del dominio'

foreach ($emp in $empleados) {
   $acl = Get-Acl -Path C:\Empresa_users\$($emp.nombre).$($emp.apellido)
   
   $acl.SetAccessRuleProtection($true, $false)
   
   $acl_permisos_control_total_administrador = 'Administradores', 'FullControl', 'ContainerInherit, 0bjectInherit', 'None', 'Allow'
   
   $ace_permisos_control_total_administrador = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $acl_permisos_control_total_administrador
   
   $acl.SetAccessRule($ace_permisos_control_total_administrador)
   
   $ace_permisos_control_total_administrador | Format-Table
   
   $acl_permisos_control_total_empleado = "$($emp.nombre).$($emp.apellido)", 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow'

   $ace_permisos_control_total_empleado = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $acl_permisos_control_total_empleado

   $acl.SetAccessRule($ace_permisos_control_total_empleado)

   $ace_permisos_control_total_empleado | Format-Table

   $acl | Set-Acl -Path C:\Empresa_users\"$($emp.nombre).$($emp.apellido)"

   Set-ADUser -Identity "$($emp.nombre).$($emp.apellido)" -ScriptPath "carpetas.bat" -HomeDrive "Z" -HomeDirectory "\\Empresa-DC1\Empresa_users$\$($emp.nombre).$($emp.apellido)"
}
