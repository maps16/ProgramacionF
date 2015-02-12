#include <iostream>
#include <unistd.h>

int main(){

std::cout << ("Hola, es hora de jugar ADIVINA EL NUMERO. Primero piensaen un numero entre 1 y 10\n");

sleep(5);

std::cout << "Multiplicalo por 9.\n";

sleep(5);

std::cout << "Si el número es de dos dígitos, súmalos entre si. por ejemplo si es 25 -> 2+5=7.\n";

sleep(5);

std::cout << "El número resultante sumale 4\n";

sleep(10);

std::cout << "Bien. El resultado es 13\n";

return(0);
}
