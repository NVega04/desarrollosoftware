public class Libro{

    String nombreLibro;
    String autor;
    String isbn;
    String editorial;
    String yearpublicacion;
    Boolean disponibilidad;
    String nombreUsuario;
    String idUsuario;

    public Libro(String nombreLibro, String autor, String isbn, String editorial, String yearpublicacion, Boolean disponibilidad,
        String nombreUsuario, String idUsuario){

        this.nombreLibro = nombreLibro;
        this.autor = autor;
        this.isbn = isbn;
        this.editorial = editorial;
        this.yearpublicacion = yearpublicacion;
        this.disponibilidad = disponibilidad;
        this.nombreUsuario = nombreUsuario;
        this.idUsuario = idUsuario;
    }

    public Libro(String nombreLibro, Boolean disponibilidad, String nombreUsuario, String idUsuario){

        this.nombreLibro = nombreLibro;
        this.disponibilidad = disponibilidad;
        this.nombreUsuario = nombreUsuario;
        this.idUsuario = idUsuario;
    }
 
    public void MostrarInfo(){
        System.out.println("Titulo: "+nombreLibro);
        System.out.println("Autor: "+autor); 
        System.out.println("Código: "+isbn);
        System.out.println("Editorial: "+editorial);
        System.out.println("Año de Publicación: "+yearpublicacion);
        System.out.println("Disponiblidad: "+disponibilidad);
        System.out.println("Nombre usuario: "+nombreUsuario);
        System.out.println("Identificación usuario: "+idUsuario);
    }

    public void prestarLibro(){
        System.out.println(" - Validación para prestamo de libro");
        if(disponibilidad == true){
            System.out.println("El libro titulado: "+ nombreLibro + " ha sido prestado al usuario " + nombreUsuario + 
            " identificado con el id " + idUsuario);
        } else {
            System.out.println("El libro titulado "+ nombreLibro + " no se encuentra disponible.");
        }
    }

    public void devolverLibro(){
        System.out.println(" - Validación para proceso de devolución de libro");
        if(disponibilidad == false){
            System.out.println("El libro titulado: "+ nombreLibro + " debe ser regresado");
        } else {
            System.out.println("El libro titulado "+ nombreLibro + " se encuentra disponible.");
        }


    }

}