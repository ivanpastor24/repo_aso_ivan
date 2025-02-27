#Creo la unidad organizativa IESELCAMINAS

New-ADOrganizationalUnit -Name "IESELCAMINAS" -Path "DC=RECUPIVAN, DC=LOCAL" -Description "Unidad RecupIvan"

#Importo el fichero CSV "grupos" para que el sistema recorra la lista de elementos en busca de la información que queramos obtener

$grupos = Import-Csv "C:\Users\Administrador\Desktop\CONVOCATORIA_EXTRAORDINARIA_MAYO\Ejercicios_repaso_powershell\grupos.csv" -Delimiter ","

   #NOTA: uso el parámetro "-Delimiter" para cortar la parte de la cadena de texto perteneciente a los grupos

#Uso la función array "foreach" para poder obtener todos los nombres de los grupos del fichero grupos.csv

foreach($grupo in $grupos) {
   New-ADOrganizationalUnit -Name "$($grupo.nombre)" -Path "OU=IESELCAMINAS, DC=RECUPIVAN, DC=LOCAL"

   $oupath = "OU=$($grupo.nombre), OU=IESELCAMINAS, DC=RECUPIVAN, DC=LOCAL"

   #Creo en este mismo array los grupos para que, posteriormente, a la hora de asociar cada alumno a su grupo correspondiente no me salga el error de que el grupo en cuestión ya estee creado

   New-ADGroup -Name "$($grupo.nombre)" -GroupCategory Security -GroupScope Global -Path "$oupath"
}

#Importo el fichero CSV "alumnos" para que el sistema recorra la lista de elementos en busca de la información que queramos obtener

$alumnos = Import-Csv "C:\Users\Administrador\Desktop\CONVOCATORIA_EXTRAORDINARIA_MAYO\Ejercicios_repaso_powershell\alumnos(1).csv" -Delimiter ","
 
 #NOTA: uso el parámetro "-Delimiter" para cortar la parte de la cadena de texto perteneciente al nombre de los alumnos

#Uso la función array "foreach" para poder obtener todos los nombres de los alumnos del fichero alumnos.csv

foreach($alumno in $alumnos) {
   New-ADUser -Name "$($alumno.nombre).$($alumno.apellidos)" -Path "OU=$($alumno.grupo), OU=IESELCAMINAS, DC=RECUPIVAN, DC=LOCAL" -SamAccountName "$alumno.nombre"."$alumno.apellidos" -AccountPassword (ConvertTo-SecureString "aso2025." -AsPlainText -Force) -ChangePasswordAtLogon $false -Enabled $true

   #En este mismo array asocio los alumnos con sus correspondientes grupos

   Add-ADGroupMember -Identity "$($alumno.grupo)" -Members "$($alumno.nombre).$($alumno.apellidos)"
}
