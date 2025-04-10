# Creo la carpeta IESELCAMINAS en la raíz del sistema.

$ruta = "C:\IESELCAMINAS\"

New-Item -Path $ruta -ItemType Directory

# Comparto la carpeta creada y asigno los permisos correspondientes mediantes ACLS.

New-SmbShare -Path "C:\IESELCAMINAS" -Name "IESELCAMINAS" -FullAccess "Administrador" -Change "Usuarios del dominio"

# Obtengo los permisos por defecto de la carpeta en cuestión.

$acl= Get-Acl -Path $ruta

# Almaceno en la variable $permiso_control_total_administrador la regla de permisos 'FullControl' para el usuario administrador.

$permiso_control_total_administrador = @('Administrador', 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow')

# Mediante la directiva 'New-Object' añado una nueva linea en donde indico que el usuario administrador tendrá acceso total al recurso compartido IESELCAMINAS.

$permiso_control_total_administrador = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_control_total_administrador

# Agrego este permiso a la lista de permisos ACL.

$acl.SetAccessRule($permiso_control_total_administrador)

# Aplico esta configuración.

$acl | Set-Acl -Path $ruta

$permiso_lectura = @('Usuarios del dominio', 'Read', 'ContainerInherit, ObjectInherit', 'None', 'Allow')

$ace= New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_lectura

$acl.SetAccessRule($ace)

$acl | Set-Acl -Path $ruta

# Importo el fichero grupos.csv para que el sistema lea el campo 'nombre' de este fichero y genero un bucle foreach para que me vaya generando cada uno de los grupos asociados a este campo.

$grupos = Import-Csv "C:\Users\Administrador\Desktop\repo_aso_ivan\CONVOCATORIA_EXTRAORDINARIA_MAYO\Ejercicios_repaso_powershell\grupos.csv" -Delimiter ","

foreach ($grupo in $grupos) {

         # Genero las carpetas de los grupos dentro del directorio IESELCAMINAS.

         $path = "C:\IESELCAMINAS\$($grupo.nombre)"
         New-Item -Path $path -ItemType Directory

         $acl= Get-Acl -Path $path

         # Deshabilito la herencia de permisos para que los nodos hijos no hereden los permisos de la carpeta padre IESELCAMINAS.

         $acl.SetAccessRuleProtection($true,$false)

         $permiso_control_total_administrador = 'Administrador', 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow'

         $permiso_control_total_administrador = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_control_total_administrador

         $acl.SetAccessRule($permiso_control_total_administrador)

         $acl | Set-Acl -Path $path

         $permiso_control_total_grupos = $($grupo.nombre), 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow'

         $permiso_control_total_grupos = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_control_total_grupos

         $acl.SetAccessRule($permiso_control_total_grupos)

         $acl | Set-Acl -Path $path
}

$ruta_users = "C:\IESELCAMINAS_USERS\"

New-Item -Path $ruta_users -ItemType Directory

New-SmbShare -Path "C:\IESELCAMINAS_USERS" -Name "IESELCAMINAS_USERS$" -FullAccess "Administrador" -Change "Usuarios del dominio"

$acl= Get-Acl -Path $ruta_users

$permiso_control_total_administrador = @('Administrador', 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow')

$permiso_control_total_administrador = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_control_total_administrador

$acl.SetAccessRule($permiso_control_total_administrador)

$acl | Set-Acl -Path $ruta_users

$permiso_lectura = @('Usuarios del dominio', 'Read', 'ContainerInherit, ObjectInherit', 'None', 'Allow')

$ace= New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_lectura

$acl.SetAccessRule($ace)

$acl | Set-Acl -Path $ruta_users

$alumnos = Import-Csv "C:\Users\Administrador\Desktop\repo_aso_ivan\CONVOCATORIA_EXTRAORDINARIA_MAYO\Ejercicios_repaso_powershell\alumnos(1).csv" -Delimiter ","

foreach ($alumno in $alumnos) {

         $path_users = "C:\IESELCAMINAS_USERS\$($alumno.nombre).$($alumno.apellidos)"
         New-Item -Path $path_users -ItemType Directory

         $acl= Get-Acl -Path $path_users

         $acl.SetAccessRuleProtection($true,$false)

         $permiso_control_total_administrador = 'Administrador', 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow'

         $permiso_control_total_administrador = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_control_total_administrador

         $acl.SetAccessRule($permiso_control_total_administrador)

         $acl | Set-Acl -Path $path_users

         $permiso_control_total_alumnos = "$($alumno.nombre).$($alumno.apellidos)", 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow'

         $permiso_control_total_alumnos = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_control_total_alumnos

         $acl.SetAccessRule($permiso_control_total_alumnos)

         $acl | Set-Acl -Path $path_users
}
