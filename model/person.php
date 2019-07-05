<?php

Class person{
    
    private $name;
    private $lastname;
    private $mail;

    /*Setters*/
    private function setName($name){
        $this->name = $name;
    }

    private function setLastName($lastname){
        $this->lastname = $lastname;
    }

    private function setMail($mail){
        $this->mail = $mail;
    }
    /*Getters*/
    public funtion getName(){
        return $this->name;
    }

    public function getLastName(){
        return $this->lastname;
    }

    public function getMail(){
        return $this->mail;
    }
}