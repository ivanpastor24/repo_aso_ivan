# Comparto la carpeta IESELCAMINAS para que se pueda acceder a ella a través de la red.

Set-ADGroup -Identity $($grupo.nombre) -GroupScope Global

# Importo el fichero alumnos(1).csv para que el sistema lea el campo 'nombre' y 'apellidos' de este fichero y genero un bucle foreach para que me vaya generando cada uno de los alumnos asociados a este campo.

$alumnos = Import-Csv "C:\Users\Administrador\Desktop\repo_aso_ivan\CONVOCATORIA_EXTRAORDINARIA_MAYO\Ejercicios_repaso_powershell\alumnos(1).csv" -Delimiter ","

foreach ($alumno in $alumnos) {
         Set-ADUser -Identity "$($alumno.nombre).$($alumno.apellidos)" -ScriptPath "carpetas.bat" -HomeDrive "X:" -HomeDirectory "\\DC-RECUPIVAN\IESELCAMINAS_USERS$\$($alumno.nombre).$($alumno.apellidos)"
}
