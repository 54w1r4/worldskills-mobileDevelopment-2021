package com.quahk;

public class Father {

    void work() {
        System.out.println("Daddy is working!");
    }

    public static void main(String args[]) {
        Father father = new Father();
        Son son = new Son();

        father.work();
        son.play();
    }

}

class Son extends Father {
    void play() {
        System.out.println("Son is playing!");
    }
}
