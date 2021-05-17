package com.quahk;

public class Father {

    private void work() {
        System.out.println("Daddy is working!");
    }

    public void smokeWeed() {
        System.out.println("Smoke weed everyday!");
    }

    public static void main(String args[]) {
        Father father = new Father();

        father.work();
        father.smokeWeed();
    }

}

