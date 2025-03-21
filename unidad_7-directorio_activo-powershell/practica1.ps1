﻿$departamentosCsv = "C:\Users\Administrador\Desktop\repo_aso_ivan\unidad_7-directorio_activo-powershell\archivos\departamentos.csv"
$empleadosCsv = "C:\Users\Administrador\Desktop\repo_aso_ivan\unidad_7-directorio_activo-powershell\archivos\empleados.csv"

$departamentos = Import-Csv $departamentosCsv -Delimiter ";" 
$empleados = Import-Csv $empleadosCsv -Delimiter ";"

New-ADOrganizationalUnit -Name "Empresa" -Path "DC=EMPRESA,DC=LOCAL" -Description "Unidad Empresa"

foreach ($dep in $departamentos) {
         New-ADOrganizationalUnit -Name "$($dep.departamento)" -Path "OU=Empresa,DC=EMPRESA,DC=LOCAL"
         New-ADGroup -Name "$($dep.departamento)" -GroupCategory Security -GroupScope Global -Path "OU=$($dep.departamento),OU=Empresa,DC=EMPRESA,DC=LOCAL"
}

foreach ($emp in $empleados) {
         $grupo = $emp.departamento
         $usuario = "$($emp.nombre).$($emp.apellido)"
         
         $nombre_completo = "$($emp.nombre) $($emp.apellido)"
         
         New-ADUser -Name $nombre_completo `
                    -Path "OU=$($emp.departamento),OU=Empresa,DC=EMPRESA,DC=LOCAL" `
                    -SamAccountName "$usuario" `
                    -UserPrincipalName "$usuario@empresa.local" `
                    -AccountPassword (ConvertTo-SecureString "aso2025." -AsPlainText -Force) `
                    -GivenName $($emp.nombre) `
                    -Surname $($emp.apellido) `
                    -ChangePasswordAtLogon $true `
                    -Enabled $true `
         
         Add-ADGroupMember -Identity $grupo -Members $usuario
         
         Write-Host $usuario
}
