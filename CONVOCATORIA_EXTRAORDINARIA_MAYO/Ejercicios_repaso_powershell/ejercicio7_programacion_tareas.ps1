# Importo el fichero grupos.csv para que el sistema lea el campo 'nombre' de este fichero y genero un bucle foreach para que me vaya generando cada uno de los grupos asociados a este campo.

$grupos = Import-Csv C:\Users\Administrador\Desktop\repo_aso_ivan\CONVOCATORIA_EXTRAORDINARIA_MAYO\Ejercicios_repaso_powershell\grupos.csv -Delimiter ","

foreach ($grupo in $grupos) {

         # Introduzco en la variable "$ruta_fichero_temporal" el path donde queremos que se vaya a crear la carpeta temp, en este caso, en C:\<nombre_grupo>\<carpeta_temp>.

         $ruta_fichero_temporal = "C:\IESELCAMINAS\$($grupo.nombre)\temp"
         
         # Creo dicha carpeta asociada al directorio correspondiente.

         New-Item -Path $ruta_fichero_temporal -ItemType Directory
}
