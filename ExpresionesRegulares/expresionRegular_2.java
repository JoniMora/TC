import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.regex.Pattern;

public class expresionRegular_2 {
    public static void main(String[] args) throws IOException {
        // Definir la expresión regular a utilizar
        String expresionRegular = "^(0[8-9]|1[0-2]):([0-5][0-9])$";

        // Definir el nombre del archivo a leer
        String nombreArchivo = "Horas.txt";

        // Leer el archivo y validar las horas en cada línea
        BufferedReader br = new BufferedReader(new FileReader(nombreArchivo));
        String linea;
        while ((linea = br.readLine()) != null) {
            if (Pattern.matches(expresionRegular, linea)) {
                System.out.println("La hora \"" + linea + "\" está dentro del rango de 08:00 a 12:59.");
            } else {
                System.out.println("La hora \"" + linea + "\" no está dentro del rango de 08:00 a 12:59.");
            }
        }
        br.close();
    }
}

