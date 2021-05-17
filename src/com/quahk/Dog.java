package com.quahk;
import java.util.Scanner;

public class Dog {
    String name;
    int age;
    String color;

    public void eat() {
        System.out.println(name + " is eating!");
    }

    public void sleep() {
        System.out.println(name + " is sleeping!");
    }

    public void colorDisplay() {
        System.out.println(name + " is " + color);
    }

    public static void main(String args[]) {

        Dog dog1 = new Dog();
        dog1.name = "Jason";
        dog1.age = 8;
        dog1.color = "black";
        dog1.colorDisplay();
        dog1.eat();
        dog1.sleep();

        System.out.println("\n");

        Dog dog2 = new Dog();
        dog2.name = "Inn";
        dog2.age = 6;
        dog2.color = "white";
        dog2.colorDisplay();
        dog2.eat();
        dog2.sleep();

    }

}
