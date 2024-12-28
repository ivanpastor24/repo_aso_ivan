function tipos_pizza {
 Write-Host ""
 Write-Host "******Tipos de pizzas a elegir******"
 Write-Host "1) Vegetariana                      "
 Write-Host "2) No vegetariana                   "
 Write-Host "************************************"
 Write-Host ""
}

function ingredientes_vegetariana {
 Write-Host ""
 Write-Host "******Ingredientes pizza vegetariana******"
 Write-Host "1) Pimiento                               "
 Write-Host "2) Tofu                                   "
 Write-Host "                                          "
 Write-Host "NOTA: Los ingredientes Mozzarella y Tomate"
 Write-Host "      ya están en todas las pizzas.       "
 Write-Host "******************************************"
}

function ingredientes_no_vegetariana {
 Write-Host ""
 Write-Host "******Ingredientes pizza no vegetariana******"
 Write-Host "1) Peperoni                                  "
 Write-Host "2) Jamón                                     "
 Write-Host "3) Salmón                                    "
 Write-Host "                                             "
 Write-Host "NOTA: Los ingredientes Mozzarella y Tomate   "
 Write-Host "      ya están en todas las pizzas.          "
 Write-Host "*********************************************"
}

$opcion_1 = 'Pimiento'
$opcion_2 = 'Tofu'
$opcion_3 = 'Peperoni'
$opcion_4 = 'Jamón'
$opcion_5 = 'Salmón'

tipos_pizza
$opcion = Read-Host "Escoja la pizza que prefiera (vegetariana/no vegetariana)"
switch($opcion){
     1 {
        ingredientes_vegetariana
        Write-Host ""
        $opcion = Read-Host "Escoja el ingrediente que prefiera"
        if($opcion -eq 1){
                Write-Host "Usted ha escogido la pizza vegetariana que contiene los siguientes ingredientes: Mozzarella, Tomate y $opcion_1."
        }elseif($opcion -eq 2){
                Write-Host "Usted ha escogido la pizza vegetariana que contiene los siguientes ingredientes: Mozzarella, Tomate y $opcion_2."
        }
     }
     2 {
        ingredientes_no_vegetariana
        Write-Host ""
        $opcion = Read-Host "Escoja el ingrediente que prefiera"
        if($opcion -eq 1){
                Write-Host "Usted ha escogido la pizza no vegetariana que contiene los siguientes ingredientes: Mozzarella, Tomate y $opcion_3."
        }elseif($opcion -eq 2){
                Write-Host "Usted ha escogido la pizza no vegetariana que contiene los siguientes ingredientes: Mozzarella, Tomate y $opcion_4."
        }elseif($opcion -eq 3){
                Write-Host "Usted ha escogido la pizza no vegetariana que contiene los siguientes ingredientes: Mozzarella, Tomate y $opcion_5."
        }
     }
}
