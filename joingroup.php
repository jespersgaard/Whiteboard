<?php include("db_connect.php") ?>

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
			
			
			<td class="tab4"><a href="home.php">home</a></td>
			<td class="tab2"><a href="profile.php">profile</a></td>
			<td class="tab3"><a href="calendar.php">calendar</a></td>
			<td class="tab1">groups</td>
			<td class="login"><font color="#ffffff">welcome! | </font><a href="logout.php"> logout</a></td>
			</tr></table>

			<table cellspacing="0"><tr>
			<td class="content">
<a href="groups.php">view groups</a> | <a href="editgroup.php">edit groups</a> | <a href="creategroup.php">create a group</a> | join a group 
<h2>Join a group!</h2><h5>
		
<form method="post" action="join_group_submit.php">
					<table>
					
					<tr><td>Name of group to join:</td><td> <input type="text" name="groupToJoin" size="50"></td></tr>				
					<tr><td></td><td><input type="Submit" value="Submit"></td></tr>
					
					</table>
					
					</form>
		
</h5></td></tr>
			</table
		</div>
	</body>
</html>