<?php
session_start();
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" />
		<link rel="stylesheet" href="ovnie.css" type="text/css" media="screen" />
		<meta name="author" content="Josselin Fatah-Roux" />
		<meta name="keywords" content="ovni,extra-terrestre,mystère,paranormal,recherche,actualités,sciences" />
		<meta name="description" content="Association pour la recherche et l'étude des ovnis" />
		<title>Ovnictus - Catégories | Association pour la recherche et l'étude des ovnis</title>
	</head>
	
	<body>
		<?php require("./admin/base.php"); ?>
		<header>
			<?php require("./header.php"); ?>
		</header>
		<div class="banner">
			<?php require("./banner.php"); ?>
		</div>
		<section>
			<nav>
				<?php require("./menu.php"); ?>
			</nav>
			<article>
				<?php 
				if(isset($_GET['rubrique']))
				{
					//var_dump($_GET['rubrique']);
					$nbcategorie = $bdd->query('SELECT COUNT(*) AS totalcategories FROM categories'); //On demande le nombre de ligne pour les catégories.
					$row = $nbcategorie->fetch(PDO::FETCH_ASSOC);
					$totalcategorie = $row['totalcategories']; //On récupère le nombre total.
					if($_GET['rubrique'] >= 1 AND $_GET['rubrique'] <= $totalcategorie)
					{
						//On récupère les sous-catégories :
						$req_souscategories = $bdd->query('SELECT * FROM souscategories WHERE parent="'.$_GET['rubrique'].'"');

						while ($recup_souscategories = $req_souscategories->fetch())
						{
				?>
						<h1><strong><?php echo htmlspecialchars($recup_souscategories['titre']); ?></strong></h1>
						<ul>
				<?php
							//On récupère les articles de la sous-catégorie :
							$req_articles = $bdd->query('SELECT id, titre FROM articles WHERE liaison="'.$recup_souscategories['id'].'"');
						
							while ($recup_articles = $req_articles->fetch())
							{
				?>
							<li><a href="./articles.php?redaction=<?php echo $recup_articles['id']; ?>"><?php echo htmlspecialchars($recup_articles['titre']); ?></a></li>
				<?php
							}//Fin de la boucle des articles :
							$req_articles->closeCursor();
				?>
						</ul>
				<?php
						} //Fin de la boucle des sous-catégories :
						$req_souscategories->closeCursor();
					}
					else
					{
						echo '<p class="textCenter"><span class="erreur">Erreur, cette rubrique n\'existe pas ! Veuillez contacter l\'administrateur du site.</span></p>';
					}
				}
				else
				{
					echo '<p class="textCenter"><span class="erreur">Erreur, aucune rubrique n\'est indiquée ! Veuillez contacter l\'administrateur du site.</span></p>';
				}
				?>
			</article>
		</section>
		<footer>
			<?php require("./footer.php"); ?>
		</footer>
	</body>
	
</html>