do {
    Write-Host ""
    Write-Host "------ Menú opciones ------"
    Write-Host "a) Crear una carpeta"
    Write-Host "b) Crear un fichero nuevo"
    Write-Host "c) Cambiar el nombre de un fichero o carpeta"
    Write-Host "d) Borrar un archivo o carpeta"
    Write-Host "e) Verificar si existe un fichero o carpeta"
    Write-Host "f) Mostrar el contenido de un directorio"
    Write-Host "g) Mostrar la fecha y hora actuales"
    Write-Host "x) Salir"
    Write-Host ""

    $opcion = Read-Host "Seleccione una opción (a, b, c, d, e, f, g, x)"

    switch ($opcion) {
        "a" {
            $carpeta = Read-Host "Introduzca el nombre de la carpeta a crear"
            if (!(Test-Path $carpeta)) {
                New-Item -ItemType Directory -Path $carpeta
                Write-Host "Carpeta '$carpeta' creada con éxito."
            } else {
                Write-Host "La carpeta '$carpeta' ya existe."
            }
        }
        "b" {
            $fichero = Read-Host "Introduzca el nombre del fichero a crear (con extensión)"
            if (!(Test-Path $fichero)) {
                New-Item -ItemType File -Path $fichero
                Write-Host "Fichero '$fichero' creado con éxito."
            } else {
                Write-Host "El fichero '$fichero' ya existe."
            }
        }
        "c" {
            $fichero_carpeta = Read-Host "Introduzca el nombre del fichero o carpeta a cambiar"
            if (Test-Path $fichero_carpeta) {
                $nuevo_fichero_carpeta = Read-Host "Introduzca el nuevo nombre"
                Rename-Item -Path $fichero_carpeta -NewName $nuevo_fichero_carpeta
                Write-Host "El nombre ha sido cambiado de '$fichero_carpeta' a '$nuevo_fichero_carpeta'."
            } else {
                Write-Host "El fichero o carpeta '$fichero_carpeta' no existe."
            }
        }
        "d" {
            $archivo_carpeta = Read-Host "Introduzca el nombre del archivo o carpeta a borrar"
            if (Test-Path $archivo_carpeta) {
                Remove-Item -Path $archivo_carpeta -Recurse -Force
                Write-Host "El archivo o carpeta '$archivo_carpeta' ha sido borrado."
            } else {
                Write-Host "El archivo o carpeta '$archivo_carpeta' no existe."
            }
        }
        "e" {
            $fichero_carpeta = Read-Host "Introduzca el nombre del fichero o carpeta a verificar"
            if (Test-Path $fichero_carpeta) {
                Write-Host "El fichero o carpeta '$fichero_carpeta' existe."
            } else {
                Write-Host "El fichero o carpeta '$fichero_carpeta' no existe."
            }
        }
        "f" {
            $directorio = Read-Host "Introduzca el directorio a listar"
            if (Test-Path $directorio) {
                Get-ChildItem -Path $directorio
            } else {
                Write-Host "El directorio '$directorio' no existe."
            }
        }
        "g" {
             Write-Host "La fecha y hora actuales son: $(Get-Date -Format "dd/MM/yyyy")"
        }
        "x" {
             Write-Host "Saliendo del programa..."
        }
        default {
             Write-Host "Opción no válida. Vuelva a intentarlo de nuevo."
        }
    }
} while ($opcion -ne 'x')
