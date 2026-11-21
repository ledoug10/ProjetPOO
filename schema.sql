PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS tache;
DROP TABLE IF EXISTS produit;
DROP TABLE IF EXISTS operateur;
DROP TABLE IF EXISTS robot;

CREATE TABLE operateur (
  id_operateur INTEGER PRIMARY KEY AUTOINCREMENT,
  nom          TEXT NOT NULL UNIQUE
);

CREATE TABLE robot (
  id_robot INTEGER PRIMARY KEY AUTOINCREMENT,
  nom      TEXT NOT NULL,
  position TEXT NOT NULL DEFAULT 'DOCK'
           CHECK (position IN ('SALLE_108','MAGAUTO','DOCK'))
);

CREATE TABLE produit (
  id_produit INTEGER PRIMARY KEY AUTOINCREMENT,
  nom        TEXT NOT NULL,
  position   TEXT NOT NULL
             CHECK (position IN ('SALLE_108','MAGAUTO','DOCK')),
  id_robot   INTEGER,
  FOREIGN KEY (id_robot) REFERENCES robot(id_robot)
);

CREATE TABLE tache (
  id_tache     INTEGER PRIMARY KEY AUTOINCREMENT,
  commande     TEXT NOT NULL
               CHECK (commande IN ('RECUPERER_PRODUIT','DEPOSER_PRODUIT','RETOUR_DOCK')),
  etat         TEXT NOT NULL DEFAULT 'EN_COURS'
               CHECK (etat IN ('EN_COURS','TERMINEE')),
  date_debut   TEXT NOT NULL,
  date_fin     TEXT,
  id_operateur INTEGER NOT NULL,
  id_robot     INTEGER NOT NULL,
  FOREIGN KEY (id_operateur) REFERENCES operateur(id_operateur),
  FOREIGN KEY (id_robot)     REFERENCES robot(id_robot)
);