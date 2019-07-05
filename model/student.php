<?php

class Student{

    private static $type = 'student';

    public __construct($name, $lastname, $mail){
        $this->name = $name;
        $this->lastname = $lastname;
        $this->mail = $mail;
    }
}