# redacteur

# RAPPORT DE PROJET : APPLICATION DE GESTION DES RÉDACTEURS AVEC FLUTTER ET SQLITE

## 1. Introduction

Dans le cadre de l'apprentissage du développement mobile avec Flutter,
nous avons réalisé une application de gestion des rédacteurs utilisant
une base de données locale SQLite. Cette application permet d'effectuer
les opérations fondamentales de gestion des données, notamment l'ajout,
la consultation, la modification et la suppression des informations
relatives aux rédacteurs.

L'objectif principal de ce projet est de mettre en pratique les concepts
de développement mobile multiplateforme avec Flutter ainsi que la
gestion des bases de données locales à travers le package SQLite.

## 2. Présentation du projet

L'application développée est un système de gestion des rédacteurs
permettant aux utilisateurs d'enregistrer et de gérer les informations
personnelles des rédacteurs.

### Fonctionnalités principales

-   Ajout d'un rédacteur
-   Affichage de la liste des rédacteurs
-   Modification des informations
-   Suppression d'un rédacteur
-   Persistance locale des données

## 3. Technologies utilisées

-   **Flutter**
-   **Dart**
-   **SQLite**
-   **sqflite (\^2.4.2)**
-   **path**

## 4. Architecture du projet

    lib/
    ├── main.dart
    ├── models/
    │   └── redacteur.dart
    ├── services/
    │   └── database_manager.dart
    └── views/
        └── home.dart

## 5. Base de données

### Table `redacteur`

  Champ         Type      Description
  ------------- --------- -------------------------------
  redacteurId   INTEGER   Clé primaire auto-incrémentée
  nom           TEXT      Nom du rédacteur
  prenom        TEXT      Prénom du rédacteur
  email         TEXT      Adresse électronique

## 6. Fonctionnalités développées

### Ajout

L'utilisateur peut enregistrer un nouveau rédacteur.

### Affichage

Les données sont affichées grâce au widget `ListView.builder`.

### Modification

Les informations peuvent être modifiées via une boîte de dialogue.

### Suppression

Chaque rédacteur peut être supprimé individuellement.

## 7. Interface utilisateur

L'application utilise les widgets Flutter suivants : - Scaffold -
AppBar - TextField - TextButton - ListView.builder - AlertDialog -
IconButton - Row - Column

## 8. Difficultés rencontrées

-   Gestion de l'asynchronisme (`async/await`)
-   Actualisation de l'interface (`setState`)
-   Manipulation de SQLite
-   Gestion des listes et des modèles

## 9. Résultats obtenus

L'application permet d'effectuer avec succès toutes les opérations CRUD
: - Create - Read - Update - Delete

## 10. Les captures de test :
!['image'](/assets/images/Screenshot_20260702_233558.jpg)
!['image'](/assets/images/Screenshot_20260702_233605.jpg)
!['image'](/assets/images/Screenshot_20260702_233638.jpg)
!['image'](/assets/images/Screenshot_20260702_233701.jpg)
!['image'](/assets/images/Screenshot_20260702_233818.jpg)







## 11. Conclusion

Ce projet a permis d'acquérir des compétences pratiques en développement
mobile avec Flutter et en gestion de bases de données SQLite. Il
constitue une base solide pour le développement d'applications plus
avancées.

