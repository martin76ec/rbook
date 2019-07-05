<?php
    import('person.php');

    Class admin extends person{

        private static $type = 'admin';

        public __construct($name, $lastname, $mail){
            $this->name = $name;
            $this->lastname = $lastname;
            $this->mail = $mail;
        }
        
    }