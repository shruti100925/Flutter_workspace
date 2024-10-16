<?php


    include('connect.php');

    $pname = $_POST["pname"];
    $price = $_POST["price"];
    $desc = $_POST["description"];
   

    if($pname=="" && $price=="" && $desc=="")
    {
        echo '0';
    }
    else
    {
        $sql = "insert into product(pname,price,description) values('$pname','$price','$desc')";
        mysqli_query($con,$sql);
	mysqli_close($con);
    }

?>