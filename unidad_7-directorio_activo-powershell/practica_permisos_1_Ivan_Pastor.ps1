Get-SmbShare | Where-Object { $_.Name -ne "ADMIN$" -and $_.Name -ne "C$" -and $_.Name -ne "IPC$" }

$ruta = "C:\ASO\"

New-Item -Path $ruta -ItemType Directory -Force

New-SmbShare -Path $ruta -Name aso

Revoke-SmbShareAccess -Name aso -AccountName Todos -Force

Grant-SmbShareAccess -Name aso -AccountName profesores -AccessRight Full -Force

Grant-SmbShareAccess -Name aso -AccountName alumnos -AccessRight Read -Force
