Write-Host ""
Write-Host "******CALCULADORA******"
Write-Host "1. Sumar               "
Write-Host "2. Restar              "
Write-Host "3. Multiplicar         "
Write-Host "4. Dividir             "
Write-Host "***********************"
Write-Host ""

$opcion = Read-Host "Escoja una opción del 1 al 4"

$opciones_posibles = 1, 2, 3, 4

if($opciones_posibles -notcontains $opcion){
      Write-Host "Opción inválida. Vuelva a escoger un número del 1 al 4"
      exit
}

Write-Host ""

[int]$numero_1 = Read-Host "Introduzca un número"
[int]$numero_2 = Read-Host "Introduzca otro número"

switch ($opcion) {
      1{
        $resultado = $numero_1 + $numero_2
        Write-Host "La suma es igual a $resultado"
      }
      2{
        $resultado = $numero_1 - $numero_2
        Write-Host "La resta es igual a $resultado"
      }
      3{
        $resultado = $numero_1 * $numero_2
        Write-Host "La multiplicación es igual a $resultado"
      }
      4{
        if($numero_2 -eq 0){
              Write-Host "¡Error! No se puede dividir por cero."
        }else{
              $resultado = $numero_1 / $numero_2
              Write-Host "La división es igual a $resultado"
        }
      }     
}
