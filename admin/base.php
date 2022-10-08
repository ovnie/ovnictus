<?php
//Connexion à la base de données en PDO :
try
{
	$bdd = new PDO('mysql:host=localhost;dbname=ovnictus_1;charset=utf8;port=3308', 'ovnictus_1', 'y3e43Gz!5');
}
catch(Exception $e)
{
	die('Erreur : '.$e->getMessage());
}
?>