-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le : ven. 07 oct. 2022 à 23:49
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ovnie1329337`
--

-- --------------------------------------------------------

--
-- Structure de la table `actu`
--

DROP TABLE IF EXISTS `actu`;
CREATE TABLE IF NOT EXISTS `actu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date_actu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `actu`
--

INSERT INTO `actu` (`id`, `titre`, `message`, `date_actu`) VALUES
(1, 'Refonte du site', 'Le site a été construit pour s\'adapter à une version mobile. \r\n\r\nCertains liens sont inaccessibles \"Blog, Forum, Youtube et Minichat\" et ne doivent pas entrer en compte pour l\'évaluation. Ils sont là à titre indicatif de ce qui peut être ajouté en complément au site.\r\n\r\nCertains éléments sont susceptibles d\'évoluer ultérieurement.', '2022-03-12 05:46:57');

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `corps` longtext NOT NULL,
  `liaison` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id`, `titre`, `corps`, `liaison`) VALUES
(1, 'Ils ont vu des OVNI | Archive INA', '<h1><strong>Ils ont vu des OVNI | Archive INA</strong></h1>\r\n				<p class=\"textJustify\">Une compilation de témoignages sur les OVNI.</p>\r\n				<p class=\"textCenter\"><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ThMqBa8EECo\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe></p>\r\n				<p class=\"textRight\">Auteur : INA Société</p>\r\n', 1),
(6, 'Le parking', '<h1><strong>Le parking</strong></h1>\r\n				<script src=\"prism.js\"></script>\r\n				<h2>Méthode 1</h2>\r\n				<pre><code class=\"language-python\">#Auteur : Josselin Fatah-Roux\r\n#Le parking :\r\n\r\n#Importation des modules :\r\nimport time\r\n\r\n#Création de la classe Client :\r\nclass Client:\r\n    def __init__(self, immatriculation, heure_Arr, heure_Dep):\r\n        self.immatriculation=immatriculation\r\n        self.heure_Arr=heure_Arr\r\n        self.heure_Dep=heure_Dep\r\n\r\n#Initialisation des variables :\r\nmdpAdmin=\"abc\"\r\nmdpUtilisateur=0\r\noption=0\r\ntab_Client=[]\r\n\r\n#Tant qu\'un administrateur ne ferme pas le parking :\r\nwhile mdpUtilisateur!=mdpAdmin:\r\n    #Définition du menu :\r\n    option=int(input(\"1 : Enregistrement du client | 2 - Suivi du tableau des immatriculations | 3 - Paiement | 4 - Fermeture du parking \\n Entrez l\'option : \"))\r\n    if option==1:\r\n        #Récupération de l\'immatriculation :\r\n        immatriculation=input(\"Récupération de la plaque d\'immatriculation : \")\r\n        #Vérification que l\'immatriculation n\'est pas en double :\r\n        doublette=0\r\n        for n in range(0,len(tab_Client),1):\r\n            if tab_Client[n].immatriculation==immatriculation and tab_Client[n].heure_Dep==0:\r\n                doublette=1\r\n        if doublette==1:\r\n            #L\'immatriculation existe déjà et la voiture est sur le parking :\r\n            print(\"Vous ne pouvez pas entrer car votre voiture est déjà sur le parking\")\r\n            print(\"En cas d\'ursupation de plaque d\'immatriculation veuillez contacter la police en appellant le 16\")\r\n        elif doublette==0:\r\n            #Enregistrement du client :\r\n            heure_Arr=time.time()\r\n            heure_Dep=0\r\n            client=Client(immatriculation,heure_Arr,heure_Dep)\r\n            tab_Client.append(client) #équivalent tab_Client+=[client] ou tab_Client=tab_Client+[client]\r\n            print(\"Votre immatriculation a été enregistrée\")\r\n    elif option==2:\r\n        #Suivi du tableau des immatriculations :\r\n        for k in range(0,len(tab_Client),1):\r\n            if tab_Client[k].heure_Dep==0:\r\n                print(\"Heure d\'arrivée :\",time.ctime(tab_Client[k].heure_Arr),\"| Immatriculation :\",tab_Client[k].immatriculation,\"| Heure de départ : actuellement sur le parking\")\r\n            else:\r\n                print(\"Heure d\'arrivée :\",time.ctime(tab_Client[k].heure_Arr),\"| Immatriculation :\",tab_Client[k].immatriculation,\"| Heure de départ :\",time.ctime(tab_Client[k].heure_Dep))\r\n    elif option==3:\r\n        #Calcul de la durée de stationnement en heure :\r\n        paiement=0\r\n        facture=0\r\n        immatriculation=input(\"Récupération de la plaque d\'immatriculation : \")\r\n        heure_Dep=time.time()\r\n        for i in range(0,len(tab_Client),1):\r\n            if tab_Client[i].immatriculation==immatriculation and tab_Client[i].heure_Dep==0:\r\n                tab_Client[i].heure_Dep=heure_Dep\r\n                recup_Heure_Arr=tab_Client[i].heure_Arr\r\n        heure_diff=heure_Dep-recup_Heure_Arr\r\n        heure_diff=heure_diff/3600\r\n        #Calcul de la facture :\r\n        if heure_diff*60&lt;30:\r\n            facture=1.20\r\n        elif heure_diff*60&lt;60 and heure_diff*60&gt;=30:\r\n            facture=1.70\r\n        else:\r\n            facture=int(heure_diff)*2\r\n        #Paiement de la facture :\r\n        while paiement&lt;facture:\r\n            argent=float(input(\"Veuillez insérer \"+str(facture-paiement)+\" : \"))\r\n            paiement=paiement+argent\r\n        #Rendu monnaie éventuel :\r\n        rendu=abs(facture-paiement)\r\n        print(\"Votre rendu monnaie est de :\",rendu,\"euro(s)\")\r\n        print (\"Au revoir ...\")\r\n    elif option==4:\r\n       mdpUtilisateur=input(\"Entrez le mot de passe d\'administrateur pour fermer le parking : \")\r\nprint (\"Fermeture du parking !\")</code></pre>\r\n				<p><a href=\"https://ovnie.com/python/parking_meth1.py\">parking_meth1.py</a></p>\r\n				<h2>Méthode 2</h2>\r\n				<pre><code class=\"language-python\">#Auteur : Josselin Fatah-Roux\r\n#Le parking :\r\n\r\n#Importation des modules :\r\nimport time\r\n\r\n#Création de la classe Client :\r\nclass Client:\r\n    def __init__(self, immatriculation, heure_Arr, heure_Dep):\r\n        self.immatriculation=immatriculation\r\n        self.heure_Arr=heure_Arr\r\n        self.heure_Dep=heure_Dep\r\n\r\n#Initialisation des variables :\r\nmdpAdmin=\"abc\"\r\nmdpUtilisateur=0\r\noption=0\r\ntab_Client=[]\r\n\r\n#Tant qu\'un administrateur ne ferme pas le parking :\r\nwhile mdpUtilisateur!=mdpAdmin:\r\n    #Définition du menu :\r\n    option=int(input(\"1 : Enregistrement du client | 2 - Suivi du tableau des immatriculations | 3 - Paiement | 4 - Fermeture du parking \\n Entrez l\'option : \"))\r\n    if option==1:\r\n        #Récupération de l\'immatriculation :\r\n        immatriculation=input(\"Récupération de la plaque d\'immatriculation : \")\r\n        #Vérification que l\'immatriculation n\'est pas en double :\r\n        doublette=0\r\n        for n in range(0,len(tab_Client),1):\r\n            if tab_Client[n][0]==immatriculation and tab_Client[n][2]==0:\r\n                doublette=1\r\n        if doublette==1:\r\n            #L\'immatriculation existe déjà et la voiture est sur le parking :\r\n            print(\"Vous ne pouvez pas entrer car votre voiture est déjà sur le parking\")\r\n            print(\"En cas d\'ursupation de plaque d\'immatriculation veuillez contacter la police en appellant le 16\")\r\n        elif doublette==0:\r\n            #Enregistrement du client :\r\n            heure_Arr=time.time()\r\n            heure_Dep=0\r\n            client=Client(immatriculation,heure_Arr,heure_Dep)\r\n            tab_Client.append([client.immatriculation,client.heure_Arr,client.heure_Dep])\r\n    elif option==2:\r\n        #Suivi du tableau des immatriculations :\r\n        for k in range(0,len(tab_Client),1):\r\n            if tab_Client[k][2]==0:\r\n                print(\"Heure d\'arrivée :\",time.ctime(tab_Client[k][1]),\"| Immatriculation :\",tab_Client[k][0],\"| Heure de départ : actuellement sur le parking\")\r\n            else:\r\n                print(\"Heure d\'arrivée :\",time.ctime(tab_Client[k][1]),\"| Immatriculation :\",tab_Client[k][0],\"| Heure de départ :\",time.ctime(tab_Client[k][2]))\r\n    elif option==3:\r\n        #Calcul de la durée de stationnement en heure :\r\n        paiement=0\r\n        facture=0\r\n        immatriculation=input(\"Récupération de la plaque d\'immatriculation : \")\r\n        heure_Dep=time.time()\r\n        for i in range(0,len(tab_Client),1):\r\n            if tab_Client[i][0]==immatriculation and tab_Client[i][2]==0:\r\n                tab_Client[i][2]=heure_Dep\r\n                recup_Heure_Arr=tab_Client[i][1]\r\n        heure_diff=heure_Dep-recup_Heure_Arr\r\n        heure_diff=heure_diff/3600\r\n        #Calcul de la facture :\r\n        if heure_diff*60&lt;30:\r\n            facture=1.20\r\n        elif heure_diff*60&lt;60 and heure_diff*60&gt;=30:\r\n            facture=1.70\r\n        else:\r\n            facture=int(heure_diff)*2\r\n        print(facture)\r\n        #Paiement de la facture :\r\n        while paiement&lt;facture:\r\n            argent=float(input(\"Veuillez insérer \"+str(facture-paiement)+\" : \"))\r\n            paiement=paiement+argent\r\n        #Rendu monnaie éventuel :\r\n        rendu=abs(facture-paiement)\r\n        print(\"Votre rendu monnaie est de :\",rendu,\"euro(s)\")\r\n        print (\"Au revoir ...\")\r\n    elif option==4:\r\n        mdpUtilisateur=input(\"Entrez le mot de passe d\'administrateur : \")\r\nprint (\"Fermeture du parking !\")</code></pre>\r\n				<p><a href=\"https://ovnie.com/python/parking_meth2.py\">parking_meth2.py</a></p>\r\n', 2);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `titre`) VALUES
(1, 'Internet'),
(2, 'Dossiers');

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

DROP TABLE IF EXISTS `commentaires`;
CREATE TABLE IF NOT EXISTS `commentaires` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `num_redac` int(11) NOT NULL,
  `date_commentaire` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commentaires`
--

INSERT INTO `commentaires` (`id`, `pseudo`, `message`, `num_redac`, `date_commentaire`) VALUES
(1, 'ovnie', 'Test de la fonctionnalité des commentaires sur un premier article.', 1, '2022-03-12 05:29:42'),
(2, 'ovnie', 'Test de la fonctionnalité des commentaires sur un deuxième article.', 2, '2022-03-12 05:30:56');

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

DROP TABLE IF EXISTS `membres`;
CREATE TABLE IF NOT EXISTS `membres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `motdepasse` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `membres`
--

INSERT INTO `membres` (`id`, `pseudo`, `mail`, `motdepasse`) VALUES
(1, 'ovnie', 'vufic@outlook.com', '62e9b87011fe6c1ae4c4732f411dab65');

-- --------------------------------------------------------

--
-- Structure de la table `souscategories`
--

DROP TABLE IF EXISTS `souscategories`;
CREATE TABLE IF NOT EXISTS `souscategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `parent` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `souscategories`
--

INSERT INTO `souscategories` (`id`, `titre`, `parent`) VALUES
(1, 'Vidéos d\'internet', 1),
(2, 'Documents', 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
