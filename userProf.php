<?php include('db_connect.php'); ?>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<LINK href="stylesheet.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div class="header">
			<img src="logo.jpg"/>
		</div>
		<div class="body">
			<table padding-left="5px" cellspacing="0">
			<tr><td class="blank"></td>
			
			
			<td class="tab2"><a href="home.php">home</a></td>
			<td class="tab1">profile</td>
			<td class="tab3"><a href="calendar.php">calendar</a></td>
			<td class="tab4"><a href="groups.php">groups</a></td>
			<td class="login"><font color="#ffffff">welcome! | </font><a href="logout.php"> logout</a></td>
			</tr></table>

			<table cellspacing="0"><tr>
			<td class="content">
	<a href="profile.php">view my profile </a> | <a href="editProfile.php">edit my profile </a>
<h4>

<table>
		<?php  

			$name = $_SESSION['username'];
			$u = $_GET['user'];
			$user = (string)$u;   
			   
	
			  echo("<tr><td><h2>User: $user</h2>");			 	   
			   $query = "select Avatar from users WHERE username = '$user'";
			   $result = mysqli_query($db, $query);
			  while($row = mysqli_fetch_array($result)){
				$content = $row['Avatar'];				
				echo("<h5><img src= $content /></h5>");
			}
			 echo("<tr><td><h4>Email:</h4>");
			   $query = "select email from users WHERE username = '$user'";
			   $result = mysqli_query($db, $query);
			  while($row = mysqli_fetch_array($result)){
				$content = $row['email'];				
				echo("<h5>$content</h5>");
			}		
			echo("<h2>$user's Groups:</h2>");
			  $name = $_SESSION['username'];			 
			  $query = "SELECT u.userName, g.groupName FROM users u inner join groups 
g INNER JOIN memberJunction m ON u.userName = m.userName 
AND g.groupName = m.groupName WHERE u.username = '$user'";
			  $result = mysqli_query($db, $query);
			  echo '<table><h5>';
			  while($row = mysqli_fetch_array($result)){
				
				$content = $row['groupName'];
				echo("<tr><td><a href='groupProf.php?group=$content'>$content</a></td>");
			}
			echo "</h5></table>";				
?>
			</td></tr>	
			
			</h4></td></tr>
			
			</table
		</div>
		</br>
		
	</body>
</html>