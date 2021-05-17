package com.quahk;

public class Son extends Father {

    private void play() {
        System.out.println("Son is playing!");
    }

    @Override
    public void smokeWeed() {
        //super.smokeWeed();
        System.out.println("I don't smoke weed!");
    }

    public static void main(String args[]) {

        Son son = new Son();
        son.play();
        son.smokeWeed();

    }

}
