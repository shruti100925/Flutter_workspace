<?php


    include('connect.php');

    $id=$_POST["id"];
    $pname = $_POST["pname"];
    $price = $_POST["price"];
    $description = $_POST["description"];
    
    


    if($id=="" && $pname=="" && $price=="" && $description=="")
    {
        echo '0';
    }
    else
    {
        $sql = "update product set pname='$pname',price='$price',description='$description' where id='$id'";
        mysqli_query($con,$sql);
    }





?>