[int]$horas_trabajadas = Read-Host "Introduzca el número de horas trabajadas"
[int]$coste_hora = Read-Host "Introduzca el coste por hora"

$salario = $horas_trabajadas * $coste_hora

Write-Host "El salario que debemos pagar al trabajador es de $salario €."
