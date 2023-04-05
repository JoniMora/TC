import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class expresionRegular_1 {

    public static void main(String[] args) {
        
        // Expresión regular para fechas correspondientes a los meses pares en el formato DD/MM/YYYY
        String regex = "\\b(0[2468]|[1][02])\\/(0[1-9]|[1-2][0-9]|3[01])\\/\\d{4}\\b";
        
        // Nombre y ubicación del archivo a leer
        String archivo = "FechasHoras.txt";
        
        // Pattern para poder compilar/manipular expresion regular
        Pattern pattern = Pattern.compile(regex);
        
        try (BufferedReader br = new BufferedReader(new FileReader(archivo))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                Matcher matcher = pattern.matcher(linea);
                
                while (matcher.find()) {
                    String fecha = matcher.group();
                    System.out.println("Fecha encontrada: " + fecha);
                }
            }
            
        } catch (IOException e) {
            e.printStackTrace();
        }
        
    }
    
}
