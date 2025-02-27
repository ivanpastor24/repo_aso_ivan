New-ADOrganizationalUnit -Name "IESELCAMINAS" -Path "DC=RECUPIVAN.LOCAL" -Description "Unidad Ivan"

$ruta = "OU=IESELCAMINAS,DC=RECUPIVAN,DC=LOCAL"

New-ADOrganizationalUnit -Name "1ASIR" -Path "$ruta" -Description "Unidad 1ASIR"

