-- Données de base pour le projet Pharmacie
-- Dispensaire (Etablissements de santé qui passent commande de médicaments)
-- Le fichier est chargé au démarrage de l''application

-- Insertion des catégories de médicaments
INSERT INTO CATEGORIE (CODE, LIBELLE, DESCRIPTION) VALUES
(DEFAULT, 'Antalgiques et Antipyrétiques', 'Médicaments contre la douleur et la fièvre'), -- code : 1
(DEFAULT, 'Anti-inflammatoires', 'Médicaments réduisant l''inflammation'), -- code : 2
(DEFAULT, 'Antibiotiques', 'Médicaments pour traiter les infections bactériennes'),
(DEFAULT, 'Antihypertenseurs', 'Médicaments pour traiter l''hypertension artérielle'),
(DEFAULT, 'Antidiabétiques', 'Médicaments pour traiter le diabète'),
(DEFAULT, 'Antihistaminiques', 'Médicaments pour traiter les allergies'),
(DEFAULT, 'Vitamines et Compléments', 'Suppléments nutritionnels'),
(DEFAULT, 'Médicaments Cardiovasculaires', 'Médicaments pour le cœur et la circulation'),
(DEFAULT, 'Médicaments Gastro-intestinaux', 'Médicaments pour les troubles digestifs'),
(DEFAULT, 'Médicaments Respiratoires', 'Médicaments pour les troubles respiratoires');


-- Catégorie 1: Antalgiques et Antipyrétiques
INSERT INTO MEDICAMENT (NOM, CATEGORIE_CODE, QUANTITE_PAR_UNITE, PRIX_UNITAIRE, UNITES_EN_STOCK, UNITES_COMMANDEES, NIVEAU_DE_REAPPRO, INDISPONIBLE, imageURL) VALUES
('Morphine 10mg', 1, 'Boîte de 14 comprimés', 25.80, 80, 0, 15, false, 'https://images.unsplash.com/photo-1550572017-edd951aa8f72?w=400'),
('Doliprane Effervescent 1g', 1, 'Boîte de 8 comprimés', 3.50, 280, 0, 30, false, 'https://images.unsplash.com/photo-1587854692152-cbe660dbde88?w=400'),
('Efferalgan Vitamine C', 1, 'Boîte de 16 comprimés', 4.20, 220, 0, 25, false, 'https://images.unsplash.com/photo-1576091160550-2173dba999ef?w=400');

-- Catégorie 2: Anti-inflammatoires
INSERT INTO MEDICAMENT (NOM, CATEGORIE_CODE, QUANTITE_PAR_UNITE, PRIX_UNITAIRE, UNITES_EN_STOCK, UNITES_COMMANDEES, NIVEAU_DE_REAPPRO, INDISPONIBLE, imageURL) VALUES
('Étodolac 400mg', 2, 'Boîte de 14 comprimés', 12.50, 110, 0, 15, false, 'https://images.unsplash.com/photo-1471864190281-a93a3070b6de?w=400'),
('Flurbiprofène 100mg', 2, 'Boîte de 30 comprimés', 10.80, 130, 0, 16, false, 'https://images.unsplash.com/photo-1550572017-edd951aa8f72?w=400');

-- Catégorie 3: Antibiotiques (2 médicaments indisponbibles)
INSERT INTO MEDICAMENT (NOM, CATEGORIE_CODE, QUANTITE_PAR_UNITE, PRIX_UNITAIRE, UNITES_EN_STOCK, UNITES_COMMANDEES, NIVEAU_DE_REAPPRO, INDISPONIBLE, imageURL) VALUES
('Lévofloxacine 500mg', 3, 'Boîte de 7 comprimés', 15.80, 160, 0, 18, true, 'https://images.unsplash.com/photo-1628771065518-0d82f1938462?w=400'),
('Clindamycine 300mg', 3, 'Boîte de 16 gélules', 13.20, 140, 0, 16, true, 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400');
-- ============================================================================
-- 3. LES DISPENSAIRES (Clients Institutionnels)
-- Codes alphanumériques (D01, D02...) et adresses aplaties dans la table.
-- ============================================================================

INSERT INTO DISPENSAIRE (CODE, NOM, CONTACT, FONCTION, TELEPHONE, FAX, ADRESSE, VILLE, REGION, CODE_POSTAL, PAYS) VALUES
('D01', 'Clinique Pasteur', 'Dr. Alric', 'Chef de Service', '0561000000', '0561000001', '45 Avenue de Lombez', 'Toulouse', 'Occitanie', '31300', 'France'),
('D02', 'Hôpital Saint-Antoine', 'Mme. Valois', 'Responsable Achat', '0149000000', NULL, '184 Rue du Faubourg', 'Paris', 'Île-de-France', '75012', 'France'),
('D03', 'Centre Hospitalier du Sidobre', 'M. Fabre', 'Pharmacien', '0563000000', '0563000002', 'Impasse des Capucines', 'Castres', 'Occitanie', '81100', 'France');

-- ============================================================================
-- 4. LES COMMANDES
-- Scénario : 
-- Commande 1 : Expédiée l'année dernière (pour tester les filtres de date).
-- Commande 2 & 3 : Récentes (Janvier 2026), dont une non encore expédiée.
-- ============================================================================

-- Commande passée par la Clinique Pasteur (D01) en 2025
INSERT INTO COMMANDE (SAISIE_LE, ENVOYEE_LE, PORT, REMISE, DESTINATAIRE, ADRESSE, VILLE, REGION, CODE_POSTAL, PAYS, DISPENSAIRE_CODE) VALUES
('2025-12-15', '2025-12-16', 25.00, 10.00, 'Pharmacie Centrale - Réception', '45 Avenue de Lombez', 'Toulouse', 'Occitanie', '31300', 'France', 'D01');

-- Commande passée par l'Hôpital Saint-Antoine (D02) le 10 Janvier 2026
INSERT INTO COMMANDE (SAISIE_LE, ENVOYEE_LE, PORT, REMISE, DESTINATAIRE, ADRESSE, VILLE, REGION, CODE_POSTAL, PAYS, DISPENSAIRE_CODE) VALUES
('2026-01-10', NULL, 45.50, 0.00, 'Service Urgences', '184 Rue du Faubourg', 'Paris', 'Île-de-France', '75012', 'France', 'D02');

-- Commande passée par le CH du Sidobre (D03) le 14 Janvier 2026
INSERT INTO COMMANDE (SAISIE_LE, ENVOYEE_LE, PORT, REMISE, DESTINATAIRE, ADRESSE, VILLE, REGION, CODE_POSTAL, PAYS, DISPENSAIRE_CODE) VALUES
('2026-01-14', NULL, 12.00, 5.00, 'M. Fabre', 'Impasse des Capucines', 'Castres', 'Occitanie', '81100', 'France', 'D03');

-- ============================================================================
-- 5. LES LIGNES DE COMMANDE
-- Détail des produits commandés.
-- Note : Les IDs des médicaments correspondent à l'ordre d'insertion précédent.
-- 1=Morphine, 2=Doliprane, 4=Étodolac...
-- ============================================================================

-- Lignes pour la commande 1 (Toulouse)
INSERT INTO LIGNE (QUANTITE, COMMANDE_NUMERO, MEDICAMENT_REFERENCE) VALUES (50, 1, 2); -- 50 boites de Doliprane
INSERT INTO LIGNE (QUANTITE, COMMANDE_NUMERO, MEDICAMENT_REFERENCE) VALUES (10, 1, 1); -- 10 boites de Morphine

-- Lignes pour la commande 2 (Paris)
INSERT INTO LIGNE (QUANTITE, COMMANDE_NUMERO, MEDICAMENT_REFERENCE) VALUES (100, 2, 3); -- 100 boites d'Efferalgan
INSERT INTO LIGNE (QUANTITE, COMMANDE_NUMERO, MEDICAMENT_REFERENCE) VALUES (20, 2, 4);  -- 20 boites d'Étodolac

-- Lignes pour la commande 3 (Castres)
INSERT INTO LIGNE (QUANTITE, COMMANDE_NUMERO, MEDICAMENT_REFERENCE) VALUES (5, 3, 1);   -- 5 boites de Morphine
INSERT INTO LIGNE (QUANTITE, COMMANDE_NUMERO, MEDICAMENT_REFERENCE) VALUES (30, 3, 5);  -- 30 boites de Flurbiprofène