<div class="row">
  <div class="col-md-12">
    <h2><b>GARAGE</b> <font face ="Ratyadu"> Tangerang</font></h2>   
    <h5>Selamat Datang!</h5>
  </div>
</div>
<hr />
<?php  
	$penjualan = $dashboard->penjualan_hariini();
	$pembelian = $dashboard->pembelian_hariini();
?>
<div class="row">
	<div class="col-md-6 col-sm-6 col-xs-6">           
		<div class="panel panel-back noti-box">
            <span class="icon-box bg-color-green set-icon">
                <i class="fa fa-usd"></i>
            </span>
           	<div class="text-box" >
                <p class="main-text"><?php echo $penjualan; ?> New</p>
                <p class="text-muted"><font color="white">Penjualan Hari Ini</font></p>
            </div>
        </div>
		</div>
	<div class="col-md-6 col-sm-6 col-xs-6">           
		<div class="panel panel-back noti-box">
            <span class="icon-box bg-color-blue set-icon">
                <i class="fa fa-cc-visa"></i>
            </span>
        	<div class="text-box" >
                <p class="main-text"><?php echo $pembelian; ?> New</p>
                <p class="text-muted"><font color="white">Pembelian Hari Ini</font></p>
            </div>
        </div>
	</div>
</div>                     