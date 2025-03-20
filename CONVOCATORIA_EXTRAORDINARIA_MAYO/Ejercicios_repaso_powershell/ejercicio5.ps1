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

# Almaceno en la variable $permiso_lectura la regla de permisos 'Read' para los usuarios del dominio.

$permiso_lectura = @('Usuarios del dominio', 'Read', 'ContainerInherit, ObjectInherit', 'None', 'Allow')

# Mediante la directiva 'New-Object' añado una nueva linea en donde indico que los usuarios del dominio tendrán acceso de solo lectura al recurso compartido IESELCAMINAS.

$ace= New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_lectura

# Agrego este permiso a la lista de permisos ACL.

$acl.SetAccessRule($ace)

# Aplico esta configuración.

$acl | Set-Acl -Path $ruta

# Importo el fichero grupos.csv para que el sistema lea el campo 'nombre' de este fichero y genero un bucle foreach para que me vaya generando cada uno de los grupos asociados a este campo.

$grupos = Import-Csv "C:\Users\Administrador\Desktop\repo_aso_ivan\CONVOCATORIA_EXTRAORDINARIA_MAYO\Ejercicios_repaso_powershell\grupos.csv" -Delimiter ","

foreach ($grupo in $grupos) {

         # Genero las carpetas de los grupos dentro del directorio IESELCAMINAS.

         $path = "C:\IESELCAMINAS\$($grupo.nombre)"
         New-Item -Path $path -ItemType Directory

         # Obtengo los permisos por defecto de cada una de las carpetas de los grupos.

         $acl= Get-Acl -Path $path

         # Deshabilito la herencia de permisos para que los nodos hijos no hereden los permisos de la carpeta padre IESELCAMINAS.

         $acl.SetAccessRuleProtection($true,$false)

         # Almaceno en la variable $permiso_control_total_administrador la regla de permisos 'FullControl' para el usuario administrador.

         $permiso_control_total_administrador = 'Administrador', 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow'

         # Mediante la directiva 'New-Object' añado una nueva linea en donde indico que el usuario administrador tendrá acceso total al recurso compartido IESELCAMINAS\<subcarpetas grupos>.

         $permiso_control_total_administrador = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_control_total_administrador

         # Agrego este permiso a la lista de permisos ACL.

         $acl.SetAccessRule($permiso_control_total_administrador)

         # Aplico esta configuración.

         $acl | Set-Acl -Path $path

         # Almaceno en la variable $permiso_control_total_grupos la regla de permisos 'FullControl' para los usuarios pertenecientes a cada uno de los grupos.

         $permiso_control_total_grupos = $($grupo.nombre), 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow'

         # Mediante la directiva 'New-Object' añado una nueva linea en donde indico que los usuarios de cada grupo tendrán acceso total al recurso compartido IESELCAMINAS\<subcarpeta grupo>.

         $permiso_control_total_grupos = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_control_total_grupos

         # Agrego este permiso a la lista de permisos ACL.

         $acl.SetAccessRule($permiso_control_total_grupos)

         # Aplico esta configuración.

         $acl | Set-Acl -Path $path
}

# Creo la carpeta IESELCAMINAS_USERS en la raíz del sistema.

$ruta_users = "C:\IESELCAMINAS_USERS\"

New-Item -Path $ruta_users -ItemType Directory

# Comparto la carpeta creada y asigno los permisos correspondientes mediantes ACLS.

New-SmbShare -Path "C:\IESELCAMINAS_USERS" -Name "IESELCAMINAS_USERS$" -FullAccess "Administrador" -Change "Usuarios del dominio"

# Obtengo los permisos por defecto de la carpeta en cuestión.

$acl= Get-Acl -Path $ruta_users

# Almaceno en la variable $permiso_control_total_administrador la regla de permisos 'FullControl' para el usuario administrador.

$permiso_control_total_administrador = @('Administrador', 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow')

# Mediante la directiva 'New-Object' añado una nueva linea en donde indico que el usuario administrador tendrá acceso total al recurso compartido IESELCAMINAS_USERS.

$permiso_control_total_administrador = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_control_total_administrador

# Agrego este permiso a la lista de permisos ACL.

$acl.SetAccessRule($permiso_control_total_administrador)

# Aplico esta configuración.

$acl | Set-Acl -Path $ruta_users

# Almaceno en la variable $permiso_lectura la regla de permisos 'Read' para los usuarios del dominio.

$permiso_lectura = @('Usuarios del dominio', 'Read', 'ContainerInherit, ObjectInherit', 'None', 'Allow')

# Mediante la directiva 'New-Object' añado una nueva linea en donde indico que los usuarios del dominio tendrán acceso de solo lectura al recurso compartido IESELCAMINAS_USERS.

$ace= New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_lectura

# Agrego este permiso a la lista de permisos ACL.

$acl.SetAccessRule($ace)

# Aplico esta configuración.

$acl | Set-Acl -Path $ruta_users

# Importo el fichero alumnos(1).csv para que el sistema lea el campo 'nombre' y 'apellidos' de este fichero y genero un bucle foreach para que me vaya generando cada uno de los alumnos asociados a este campo.

$alumnos = Import-Csv "C:\Users\Administrador\Desktop\repo_aso_ivan\CONVOCATORIA_EXTRAORDINARIA_MAYO\Ejercicios_repaso_powershell\alumnos(1).csv" -Delimiter ","

foreach ($alumno in $alumnos) {

         # Genero las carpetas de los alumnos dentro del directorio IESELCAMINAS_USERS.

         $path_users = "C:\IESELCAMINAS_USERS\$($alumno.nombre).$($alumno.apellidos)"
         New-Item -Path $path_users -ItemType Directory

         # Obtengo los permisos por defecto de cada una de las carpetas de los alumnos.

         $acl= Get-Acl -Path $path_users

         # Deshabilito la herencia de permisos para que los nodos hijos no hereden los permisos de la carpeta padre IESELCAMINAS_USERS.

         $acl.SetAccessRuleProtection($true,$false)

         # Almaceno en la variable $permiso_control_total_administrador la regla de permisos 'FullControl' para el usuario administrador.

         $permiso_control_total_administrador = 'Administrador', 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow'

         # Mediante la directiva 'New-Object' añado una nueva linea en donde indico que el usuario administrador tendrá acceso total al recurso compartido IESELCAMINAS_USERS\<subcarpetas alumnos>.

         $permiso_control_total_administrador = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_control_total_administrador

         # Agrego este permiso a la lista de permisos ACL.

         $acl.SetAccessRule($permiso_control_total_administrador)

         # Aplico esta configuración.

         $acl | Set-Acl -Path $path_users

         # Almaceno en la variable $permiso_control_total_alumnos la regla de permisos 'FullControl' para cada uno de los alumnos.

         $permiso_control_total_alumnos = "$($alumno.nombre).$($alumno.apellidos)", 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow'

         # Mediante la directiva 'New-Object' añado una nueva linea en donde indico que los alumnos tendrán acceso total al recurso compartido IESELCAMINAS_USERS\<subcarpeta alumno>.

         $permiso_control_total_alumnos = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permiso_control_total_alumnos

         # Agrego este permiso a la lista de permisos ACL.

         $acl.SetAccessRule($permiso_control_total_alumnos)

         # Aplico esta configuración.

         $acl | Set-Acl -Path $path_users
}
