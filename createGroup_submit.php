<?php 
   include('db_connect.php');

   $gname = $_POST['groupName'];
   $admin = $_POST['groupAdmin'];
   $name = $_SESSION['username'];
   $description = $_POST['groupDescription']; 
   
   $query = "INSERT INTO groups (groupName, groupadmin, groupdescription) VALUES ('$gname', '$admin', '$description')";

   echo($query);
   
  
   mysqli_query($db,$query) or die("Query Failed LOLZ");
   //$query2 = "INSERT INTO memberjunction VALUES ('$name','$gname')";
  // mysqli_query($db, $query2) or die("Query2 Failed LOLZ");
   
   echo '<meta HTTP-EQUIV="REFRESH" content="0; url=http://localhost/Whiteboard/groups.php">';
?>