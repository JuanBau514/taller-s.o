#include <iostream>
#include <cstdlib>  // Para system()

int main() {
    std::string os;
    
    std::cout << "Seleccione su sistema operativo (Windows/Linux): ";
    std::getline(std::cin, os);
    
    if (os == "Windows" || os == "windows") {
        std::cout << "Ejecutando el script para Windows..." << std::endl;
        // Ejecutar el script .bat
        system("prueba.bat");
    } else if (os == "Linux" || os == "linux") {
        std::cout << "Ejecutando el script para Linux..." << std::endl;
        // Ejecutar el script .sh
        system("sh prueba.sh");
    } else {
        std::cerr << "Sistema operativo no reconocido." << std::endl;
    }

    return 0;
}
