## GIT COMMANDS
[Github Mariano Nieves](https://github.com/marianonieves/kbot) 

```bash
git status
git commit -a -m "default messsage"
git push
```

- - -

## EJERCICIO DE FACTURACION
Construir una aplicación de línea de comando que permita calcular los datos de facturación incluyendo impuestos y descuentos.
Debe poder ejecutarse con la línea de comando:
$ ruby factura.rb <cantidad> <precio unitario> <estado>

IMPUESTOS (Estado, Tasa % )
```bash
impuestos={ "UT"=> 6.85,  "NV"=> 8.0,  "TX"=> 6.25,  "AL"=> 4.00,  "CA"=> 8.25 }
```

DESCUENTOS (Mas de,  % )
```bash
descuentos
Mas de $1000 :: 3%
Mas de $5000 :: 5%
Mas de $7000 :: 7%
Mas de $10000 :: 10%
Mas de $50000 :: 15%
descuentos={ 1000=> 3, 5000=>5, 7000=>7, 10000=>10, 50000=>15 }

```


## Ejemplo
```bash
$ ruby factura.rb 5 10 AL
5 * $10 = $50
AL(%4.0) = $2
DTO(%0) = $0
Total = $52
```
