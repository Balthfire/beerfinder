#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: beer
#------------------------------------------------------------

CREATE TABLE beer(
        id_beer      int (11) Auto_increment  NOT NULL ,
        name         Varchar (25) ,
        price        Double ,
        description  Varchar (100) ,
        id_beer_type Int ,
        id_origin    Int ,
        PRIMARY KEY (id_beer )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: bar
#------------------------------------------------------------

CREATE TABLE bar(
        id_bar      int (11) Auto_increment  NOT NULL ,
        name        Varchar (50) ,
        address     Varchar (100) ,
        gps_coord   Varchar (100) ,
        terrasse    Bool ,
        open_hours  Varchar (25) ,
        happy_hours Varchar (25) ,
        PRIMARY KEY (id_bar )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: beer_type
#------------------------------------------------------------

CREATE TABLE beer_type(
        id_beer_type int (11) Auto_increment  NOT NULL ,
        name         Varchar (100) ,
        PRIMARY KEY (id_beer_type )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: beer_origin
#------------------------------------------------------------

CREATE TABLE beer_origin(
        id_origin int (11) Auto_increment  NOT NULL ,
        name      Varchar (100) ,
        PRIMARY KEY (id_origin )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: serve
#------------------------------------------------------------

CREATE TABLE serve(
        id_beer Int NOT NULL ,
        id_bar  Int NOT NULL ,
        PRIMARY KEY (id_beer ,id_bar )
)ENGINE=InnoDB;

ALTER TABLE beer ADD CONSTRAINT FK_beer_id_beer_type FOREIGN KEY (id_beer_type) REFERENCES beer_type(id_beer_type);
ALTER TABLE beer ADD CONSTRAINT FK_beer_id_origin FOREIGN KEY (id_origin) REFERENCES beer_origin(id_origin);
ALTER TABLE serve ADD CONSTRAINT FK_serve_id_beer FOREIGN KEY (id_beer) REFERENCES beer(id_beer);
ALTER TABLE serve ADD CONSTRAINT FK_serve_id_bar FOREIGN KEY (id_bar) REFERENCES bar(id_bar);
