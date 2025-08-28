//SUMA

import java.util.Scanner;

public class Main{
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);

        System.out.print("Ingresa un número: ");
        int num1 = scanner.nextInt();

        System.out.print("Ingresa un número: ");
        int num2 = scanner.nextInt();

        int resultado = num1 + num2;

        System.out.println("El resultado de la suma es: " + resultado);
    }
}

