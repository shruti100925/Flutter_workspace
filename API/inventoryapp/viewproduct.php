<?php

    include('connect.php');
    
    $sql ="select * from product";
    $r=mysqli_query($con,$sql);
    $response = array();
    
    
    while($row = mysqli_fetch_array($r))
    {
        $value["pname"]=$row["pname"];
        $value["price"]=$row["price"];
        $value["description"]=$row["description"];
           
        
    
        array_push($response,$value);
        
    }
    
    echo json_encode($response);
    mysqli_close($con);


?>