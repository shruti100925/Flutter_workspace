<?php


    include('connect.php');

    $fname = $_POST["fname"];
    $lname = $_POST["lname"];
    $email = $_POST["email"];
    $pass = $_POST["pass"];
    $gender = $_POST["gender"];
    $city = $_POST["city"];


    if($fname=="" && $lname=="" && $email=="" && $pass=="" && $gender=="" && $city=="")
    {
        echo '0';
    }
    else
    {
        $sql = "insert into register(fname,lname,email,pass,gender,city) values ('$fname','$lname','$email','$pass','$gender','$city')";
        mysqli_query($con,$sql);
    }





?>