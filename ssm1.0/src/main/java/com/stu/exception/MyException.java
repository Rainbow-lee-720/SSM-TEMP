package com.stu.exception;

public class MyException extends Exception{
    private String message;

    
    public MyException(){

    }

    public MyException(String message){
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
