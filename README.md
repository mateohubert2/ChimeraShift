# ChimeraShift

**ChimeraShift** est une solution de pentesting innovante qui intègre des concepts d'autonomic computing pour offrir une analyse de sécurité avancée et adaptative des infrastructures. En combinant une interface graphique intuitive et une approche basée sur la boucle de contrôle fermée **MAPE-K**, ChimeraShift va au-delà des tests automatiques classiques en adaptant et en affinant continuellement ses méthodes d'attaque.

---

## Table des Matières

- [Introduction](#introduction)
- [Fonctionnalités](#fonctionnalités)
- [Architecture et Concepts Techniques](#architecture-et-concepts-techniques)
  - [Interface Utilisateur](#interface-utilisateur)
  - [Phase de Découverte](#phase-de-découverte)
  - [Boucle de Contrôle MAPE-K](#boucle-de-contrôle-mape-k)
- [Installation et Configuration](#installation-et-configuration)
- [Utilisation](#utilisation)
- [Licence](#licence)

---

## Introduction

ChimeraShift a été conçu pour répondre aux besoins d’une sécurité offensive évolutive. En automatisant et en adaptant les tests de pénétration, il permet d’identifier non seulement les failles de sécurité de manière proactive mais aussi de réagir en temps réel aux mécanismes de défense mis en place par les infrastructures cibles. La solution cible aussi bien des environnements complexes que des configurations standard, et s’adapte aux défis modernes de la cybersécurité.

---

## Fonctionnalités

- **Interface Graphique Interactive** : Permet aux utilisateurs de sélectionner et de configurer les cibles à tester via une interface intuitive.
- **Phase de Découverte Automatisée** : Identification des services et machines présents dans l’infrastructure grâce à des techniques de reconnaissance et de scanning.
- **Approche MAPE-K** : Utilisation de la boucle de contrôle MAPE-K (Monitor, Analyze, Plan, Execute, Knowledge) pour adapter dynamiquement les tests en fonction des retours et de l’évolution de la situation.
- **Attaques Avancées et Corrélations** : Capacité à établir des liaisons entre différents services pour lancer des attaques sophistiquées, en s’ajustant aux éventuels mécanismes de sécurité mis en place.
- **Extensibilité et Modularité** : Architecture modulaire permettant l’ajout de nouveaux modules de test et de techniques d’analyse pour répondre aux besoins spécifiques de divers environnements.

---

## Architecture et Concepts Techniques

### Interface Utilisateur

L’interface graphique de ChimeraShift offre une expérience utilisateur optimisée pour la configuration et le lancement des tests. Les utilisateurs peuvent :
- Sélectionner les cibles (IP, domaines, sous-réseaux)
- Configurer des paramètres de tests spécifiques
- Visualiser en temps réel les résultats et l’évolution des tests

### Phase de Découverte

Lors de la phase initiale, ChimeraShift effectue une reconnaissance complète de l’infrastructure :
- **Scan de Port et Service** : Identification des ports ouverts et des services actifs.
- **Fingerprinting** : Détermination des versions et configurations des services pour identifier les vulnérabilités potentielles.
- **Cartographie Réseau** : Création d’une topologie réseau pour mieux comprendre les interconnexions et les chemins potentiels d’attaque.

### Boucle de Contrôle MAPE-K

La force de ChimeraShift réside dans l’intégration du cycle MAPE-K, qui permet une adaptation dynamique des tests :
- **Monitor (Surveillance)** : Collecte continue des données et des retours des tests en cours.
- **Analyze (Analyse)** : Traitement et interprétation des données pour détecter les anomalies et les vulnérabilités.
- **Plan (Planification)** : Élaboration de stratégies d’attaque personnalisées basées sur l’analyse des données.
- **Execute (Exécution)** : Déploiement des tests et des attaques de manière coordonnée et en temps réel.
- **Knowledge (Connaissance)** : Mise à jour de la base de connaissances pour améliorer les futurs tests, incluant l’apprentissage sur les nouvelles menaces et mécanismes de défense.

Ce cycle permet à ChimeraShift de s’ajuster en permanence, en passant d’un test automatique basique à des attaques ciblées plus avancées lorsque nécessaire, et de réagir face aux mécanismes de sécurité mis en place.

---

## Installation et Configuration

### Prérequis

- **Système d'exploitation** : Compatible avec les distributions Linux, macOS et Windows (via environnement compatible).
- **Environnements requis** : Python (version ≥ 3.8), bibliothèques et dépendances listées dans le fichier `requirements.txt`.
- **Accès Administratif** : Pour exécuter certains tests de reconnaissance et de pentesting, des privilèges administratifs peuvent être requis.

### Étapes d’Installation

1. **Cloner le dépôt GitHub :**
   ```bash
   git clone https://github.com/votre-utilisateur/ChimeraShift.git
   cd ChimeraShift
