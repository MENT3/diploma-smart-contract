# Compte rendu projet blockain

Notre fichier contient quatres contrats :

- School
- Student
- Diploma
- Company

## Détail de nos contrats

Le contrat School définit une structure SchoolData, qui contient des informations sur une école, telles que son nom, son type, son pays, son adresse et son URL.
Le constructeur de ce contrat initialise ces informations lorsqu'un nouveau contrat School est créé et émet un événement SchoolDataSet pour informer les auditeurs de la création de ce contrat.

Le contrat Student définit une structure StudentData, qui contient des informations sur un étudiant, telles que son nom, sa date de naissance, son sexe, sa nationalité, son état civil, son adresse, son adresse e-mail, son numéro de téléphone, sa section, son sujet de projet de fin d'études (PFE), son entreprise d'accueil pour le PFE, les dates de début et de fin du stage et son évaluation.
Le constructeur de ce contrat initialise ces informations lorsqu'un nouveau contrat Student est créé et émet un événement StudentSet pour informer les auditeurs de la création de ce contrat. De plus, il contient une fonction linkToCompany qui permet à un étudiant de lier son contrat à une entreprise.

Le contrat Diploma définit une structure DiplomaData, qui contient des informations sur un diplôme, telles que son nom, son type, son pays, sa spécialité, sa mention et sa date d'obtention.
Le constructeur de ce contrat initialise ces informations lorsqu'un nouveau contrat Diploma est créé et émet un événement DiplomaDataSet pour informer les auditeurs de la création de ce contrat. Il contient également une fonction linkToRelations qui permet de lier un contrat de diplôme à des contrats d'étudiant et d'école.

Le contrat Company définit une structure CompanyData, qui contient des informations sur une entreprise, telles que son nom, son pays, sa ligne d'activité, sa date de création, sa taille, son adresse, son adresse e-mail, son numéro de téléphone et son URL.
Le constructeur de ce contrat initialise ces informations lorsqu'un nouveau contrat Company est créé et émet un événement CompanyDataSet pour informer les auditeurs de la création de ce contrat.

## Structure

Nous avons choisi de mettre en place une structure similaire à celle d'une base de données relationnelle pour organiser ses contrats. Des entités ont été définies et liées ensemble à l'aide de leurs adresses publiques respectives. Cela permet d'obtenir une architecture claire et cohérente, facilitant ainsi la gestion et l'interaction des différents contrats.
