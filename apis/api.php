<?php 
require_once "system/autoload.php";  

function App()
{
    $app = new Apps;
	$app->Appdetail();
}
function DeviceToken()
{
    $app = new Apps;
	$app->AddTokendetail();
}

function LastPlayed()
{
    $app = new Apps;
	$app->lastPlayed();
}

function NoImg()
{
    $app = new Apps;
	$app->WithoutImg();
}
?>
