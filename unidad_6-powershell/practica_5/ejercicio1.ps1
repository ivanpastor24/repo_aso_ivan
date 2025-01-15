Function Sumar {
    param (
        [int]$numero_1,
        [int]$numero_2
    )
    $sumar = $numero_1 + $numero_2
    Write-Host "La suma es igual a $sumar"
}

Function Restar {
    param (
        [int]$numero_1,
        [int]$numero_2
    )
    $restar = $numero_1 - $numero_2
    Write-Host "La resta es igual a $restar"
}

Function Multiplicar {
    param (
        [int]$numero_1,
        [int]$numero_2
    )
    $multiplicar = $numero_1 * $numero_2
    Write-Host "La multiplicación es igual a $multiplicar"
}

Function Dividir {
    param (
        [int]$numero_1,
        [int]$numero_2
    )

    if($numero_2 -eq 0){
              Write-Host "¡Error! No se puede dividir por cero."
        }else{
              $dividir = $numero_1 / $numero_2
              Write-Host "La división es igual a $dividir"
        }
}

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
        Sumar $numero_1 $numero_2
      }
      2{
        Restar $numero_1 $numero_2
      }
      3{
        Multiplicar $numero_1 $numero_2
      }
      4{
        Dividir $numero_1 $numero_2
      }     
}
