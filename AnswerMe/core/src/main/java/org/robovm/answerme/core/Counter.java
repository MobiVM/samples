package org.robovm.answerme.core;

public class Counter {

    private int value;

    public Counter (int value) {
        this.value = value;
    }

    public void addValue (int value) {
        this.value += value;
    }

    public void minusValue (int value) {
        this.value -= value;
    }

    public int getValue () {
        return value;
    }
}
