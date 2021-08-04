<?php  
	include "../class/class.php";
	$sp = $_GET['nmsupplier'];
	//Checks if the username is available or not
	$query = "SELECT nama_supplier FROM supplier WHERE nama_supplier='$sp'";
	$result = mysql_query($query);
	$jum = mysql_num_rows($result);
	if ($jum >= 1) {
		echo "<span style='color:red; padding-left:4px;'><i class='fa fa-warning'></i> Nama Supplier Sudah Tersedia</span>";
	}
	else{
		echo "";
	}
?>