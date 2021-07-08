package com.quahk;
import java.util.Scanner;

public class dataType {

    public void floatLimit() {
        System.out.println("Float Datatype values: ");
        System.out.println("Min: " + Float.MIN_VALUE);
        System.out.println("Max: " + Float.MAX_VALUE);
        System.out.println("\n");
    }

    public void byteLimit() {
        System.out.println("Byte Datatype values: ");
        System.out.println("Min: " + Byte.MIN_VALUE);
        System.out.println("Max: " + Byte.MAX_VALUE);
        System.out.println("\n");
    }

    public void intLimit() {
        System.out.println("Integer Datatype values: ");
        System.out.println("Min: " + Integer.MIN_VALUE);
        System.out.println("Max: " + Integer.MAX_VALUE);
        System.out.println("\n");
    }

    public void shortLimit() {
        System.out.println("Short Datatype values: ");
        System.out.println("Min: " + Short.MIN_VALUE);
        System.out.println("Max: " + Short.MAX_VALUE);
        System.out.println("\n");
    }

    public void longLimit() {
        System.out.println("Long Datatype values: ");
        System.out.println("Min: " + Long.MIN_VALUE);
        System.out.println("Max: " + Long.MAX_VALUE);
        System.out.println("\n");
    }

    public void doubleLimit() {
        System.out.println("Double Datatype values: ");
        System.out.println("Min: " + Double.MIN_VALUE);
        System.out.println("Max: " + Double.MAX_VALUE);
        System.out.println("\n");
    }

    public static void main(String args[]) {
        dataType typeInfo = new dataType();

        System.out.println("Please input the data type you want query!");

        Scanner input = new Scanner(System.in);

        String userInput = input.next();

        switch (userInput) {
            case "float":
                typeInfo.floatLimit();
                break;
            case "byte":
                typeInfo.byteLimit();
                break;
            case "int":
                typeInfo.intLimit();
                break;
            case "long":
                typeInfo.longLimit();
                break;
            case "short":
                typeInfo.shortLimit();
                break;
            case "double":
                typeInfo.doubleLimit();
                break;
            default:
                System.out.println("Unknown Input! Displaying all! \n");
                typeInfo.floatLimit();
                typeInfo.byteLimit();
                typeInfo.intLimit();
                typeInfo.longLimit();
                typeInfo.shortLimit();
                typeInfo.doubleLimit();
                break;
        }

    }
}
