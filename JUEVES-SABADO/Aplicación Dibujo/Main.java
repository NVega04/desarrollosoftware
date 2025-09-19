public class Main {
    public static void main(String[] args) {
        Figura Figura = new Figura("Cuadro", "2D", "23CM", "ROJO", "5CM");
        Figura Figura2 = new Figura(true, "Circulo");

        Figura.MostrarInfo();
        Figura.cambiarColor();
        Figura2.eliminarFigura();
    }   
}