[int]$edad = Read-Host "Introduzca su edad"

for ($i = 1; $i -le $edad; $i++)
{
     Write-Host $i
}
