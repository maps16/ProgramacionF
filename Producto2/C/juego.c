#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(void){
  puts("Hola, es hora de jugar ADIVINA EL NUMERO. Primero piensa en un numero entre 1 y 10");
  sleep(5);
  
  puts("Multiplicalo por 9");
  
  sleep(5);

  puts("Si el numero es de dos digitos, sumalos entre si. Por ejemplo si es 25 -> 2+5=7");

  sleep(5);

  puts("El numero resultante sumale 4");
  
  sleep(10);

  puts("Bien. El resultado es 13");

  return(EXIT_SUCCESS);
}
 
