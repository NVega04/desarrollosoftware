public class Figura{

    String nombre;
    String dimension;
    String posicion;
    String color;
    String tamano;
    Boolean figuraCreada;

    public Figura(String nombre, String dimension, String posicion, String color, String tamano){
        this.nombre = nombre;
        this.dimension = dimension;
        this.posicion = posicion;
        this.color = color;
        this.tamano = tamano;
    }

    public Figura(Boolean figuraCreada, String nombre){
        this.nombre = nombre;
        this.figuraCreada = figuraCreada;
    }
 
    public void MostrarInfo(){
        System.out.println("DETALLES BÁSICOS DE FIGURA");
        System.out.println("Nombre figura: " + nombre);
        System.out.println("Dimensión: " + dimension);
        System.out.println("Posición de la figura: " + posicion);
        System.out.println("Color: " + color);
        System.out.println("Tamaño figura: " + tamano);
    }

    public void cambiarColor(){
        System.out.println("CAMBIO DE COLOR DE FIGURA");
        if(color == "rojo"){
            System.out.println("El nuevo color de la figura es: VERDE");
        } else if(color == "VERDE") {
            System.out.println("El nuevo color de la figura es: AMARILLO");
        } else {
            System.out.println("El color de la figura es: " + color);
        }
    }

    public void eliminarFigura(){
        System.out.println("ELIMINACIÓN DE FIGURA");
        if(figuraCreada == true){
            System.out.println("La figura " + nombre + " se ha eliminado correctamente");
        } else {
            System.out.println("No existen registros de figuras por eliminar");
        }
    }

}