[int]$numero = Read-Host "Introduzca un número"

for ($i = 1; $i -le $numero; $i++) {
     if ($i % 2 -ne 0) {
         if ($i + 2 -le $numero) {
             Write-Host -NoNewLine "$i, "
         } else {
             Write-Host -NoNewline "$i "
         }
     }
}

Write-Host ""
