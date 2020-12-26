print("-----Palindromo---")
x=raw_input("Dame una cadena\n")
inc=0
dec=len(x)-1
ban=False
tam=len(x)
for i in range(tam-1):
	if x[inc]==x[dec]:
		inc=inc+1
		dec=dec-1
		ban=True
	else:
		ban=False
if ban==False:
	print("No es palindromo")
else:
	print("Es Palindromo")
