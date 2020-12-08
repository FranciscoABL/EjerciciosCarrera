//Ejercicios Para Trabajo - Video Hola Mundo
const multiply = (a,b) => {
    let resultado = 0
    const positivo = Math.abs(b) == b
    for (i = 0;  i< Math.abs(b) ;i++) {
        resultado =positivo ? resultado + a : resultado-a
    }
    return resultado
}
const a = multiply(40,30)
console.log(a)

const getBiggest = (arr) => arr.reduce((acc,el) => acc >el ? acc:el)
const b = getBiggest([50,-1500,0,1,54])
console.log(b)