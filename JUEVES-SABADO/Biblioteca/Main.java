public class Main {
    public static void main(String[] args) {
        Libro MiLibro = new Libro("La vida", "Nelson Gómez", "9823H", "El planeta", 
                "2008", false, "Nicole Vega", "78");
        
        Libro MiLibro2 = new Libro("La divina comedia", true, "Daniel Burgos", "8912");

        MiLibro.MostrarInfo();

        MiLibro.prestarLibro();

        MiLibro2.devolverLibro();
    }
}
