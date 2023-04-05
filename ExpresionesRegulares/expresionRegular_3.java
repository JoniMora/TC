import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.regex.Pattern;

public class expresionRegular_3 {
    public static void main(String[] args) throws IOException {
        // Definir la expresión regular a utilizar
        String expresionRegular = "^(1[89]|20):(3[0-9]|30)$";

        // Definir el nombre del archivo a leer
        String nombreArchivo = "Horas.txt";

        // Leer el archivo y validar las horas en cada línea
        BufferedReader br = new BufferedReader(new FileReader(nombreArchivo));
        String linea;
        while ((linea = br.readLine()) != null) {
            if (Pattern.matches(expresionRegular, linea)) {
                System.out.println("La hora \"" + linea + "\" está dentro del rango de 18:30 a 21:30.");
            } else {
                System.out.println("La hora \"" + linea + "\" no está dentro del rango de 18:30 a 21:30.");
            }
        }
        br.close();
    }
}
