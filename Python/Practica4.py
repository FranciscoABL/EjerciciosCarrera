#Descuento en una tienda de forma dinamica
#Imprimir el valor total
precio=float(input("Digite el precio del Articulo\n"))
des=float(input("De cuanto es el descuento (0-100)\n"))

descuento=precio*(des/100);
total=precio-descuento;
print(f"el total es de {total}")
