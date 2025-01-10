[int]$numero = Read-Host "Introduzca un número"

for ($i = $numero; $i -ge 0; $i--) {
     if ($i -gt 0) {
         Write-Host -NoNewLine "$i, "
     } elseif ($i -eq 0) {
         Write-Host -NoNewLine "$i "
     }
}

Write-Host ""
