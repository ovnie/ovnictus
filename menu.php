<?php
if(isset($_POST['formconnect'])){
	$pseudoconnect = htmlspecialchars($_POST['pseudo_co']);
	$mdpconnect = md5($_POST['lemotdepasse_co']);
	if(!empty($pseudoconnect) AND !empty($mdpconnect)){
		$requser = $bdd->prepare("SELECT * FROM membres WHERE pseudo = ? AND motdepasse = ?");
		$requser->execute(array($pseudoconnect, $mdpconnect));
		$userexist = $requser->rowCount();
		if($userexist == 1){
			$userinfo = $requser->fetch();
			$_SESSION['id'] = $userinfo['id'];
			$_SESSION['pseudo'] = $userinfo['pseudo'];
			$_SESSION['mail'] = $userinfo['mail'];
		} 
		else{
			echo '<p class="textCenter"><span class="erreur">Mauvais pseudo/mot de passe !</span></p>';
		}
	} 
	else{
		echo '<p class="textCenter"><span class="erreur">Veuillez remplir tous les champs !</span></p>';
	}
}
?>
<?php
if(isset($_SESSION['id']) AND isset($_SESSION['pseudo']) AND isset($_SESSION['mail'])){
	echo '<p class="textCenter">Bienvenue : ' . $_SESSION['pseudo'] . '</p>';
	echo '<p class="textCenter"><a href="./profil.php">Profil</a>/<a href="./deconnexion.php">Déconnexion</a></p>';
}
else{
?>
	<h1><strong>Connexion</strong></h1>
	<form method="post">
	<label for="pseudo_co">Pseudo</label> : <br><input class="connect" type="text" name="pseudo_co" id="pseudo_co" />
	<br><label for="lemotdepasse_co">Mot de passe</label> : <br><input class="connect" type="password" name="lemotdepasse_co" id="lemotdepasse_co" />
	<p class="textCenter"><input type="submit" name="formconnect" value="Se connecter"><p>
	</form>
	<p class="textCenter"><a href="./inscription.php">Inscription</a></p>
<?php
}
?>
<h1><strong>Catégories</strong></h1>
<ul>
<?php
//On récupère les catégories :
$req_categories = $bdd->query('SELECT * FROM categories ORDER BY id ASC');

while ($recup_categories = $req_categories->fetch())
{
?>
	<li><a href="./categories.php?rubrique=<?php echo $recup_categories['id']; ?>" title="Ovnie - <?php echo htmlspecialchars($recup_categories['titre']); ?>" ><?php echo htmlspecialchars($recup_categories['titre']); ?></a></li>
<?php
} //Fin de la boucle des catégories :
$req_categories->closeCursor();
?>
</ul>
<h1><strong>Accès réservé</strong></h1>
<ul>
	<li><a href="./admin/message.php" title="Ovnie - News" >Les tickets</a></li>
	<li><a href="./admin/layout.php" title="Ovnie - Articles" >Les articles</a></li>
	<li><a href="./admin/membres.php" title="Ovnie - Membres" >Les membres</a></li>
</ul>