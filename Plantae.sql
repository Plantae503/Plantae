/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     01/06/2021 21:04:26                          */
/*==============================================================*/


drop table if exists Login;

drop table if exists Perfil;

drop table if exists Plantas;

drop table if exists Regas;

drop table if exists Usuarios;

/*==============================================================*/
/* Table: Login                                                 */
/*==============================================================*/
create table Login
(
   cod_login            int not null,
   cod_usuarios         int,
   des_login            char(20),
   des_senha            char(20)
);

alter table Login
   add primary key (cod_login);

/*==============================================================*/
/* Table: Perfil                                                */
/*==============================================================*/
create table Perfil
(
   cod_perfil           int not null,
   cod_usuarios         int,
   nom_perfil           char(100),
   arq_imagem           blob
);

alter table Perfil
   add primary key (cod_perfil);

/*==============================================================*/
/* Table: Plantas                                               */
/*==============================================================*/
create table Plantas
(
   cod_usuarios         int,
   cod_perfil           int,
   cod_planta           int not null,
   nom_planta           char(100),
   des_descplanta       text,
   arq_imagem           blob,
   qtdagua              float
);

alter table Plantas
   add primary key (cod_planta);

/*==============================================================*/
/* Table: Regas                                                 */
/*==============================================================*/
create table Regas
(
   cod_rega             int not null,
   cod_perfil           int,
   cod_planta           int,
   iniciorega           datetime,
   fimrega              datetime
);

alter table Regas
   add primary key (cod_rega);

/*==============================================================*/
/* Table: Usuarios                                              */
/*==============================================================*/
create table Usuarios
(
   cod_usuarios         int not null,
   nom_nome             char(50),
   nom_sobrenome        char(50,
   des_rg               char(15),
   des_cpf              char(11),
   des_endereco1        char(100),
   des_endereco2        char(100),
   des_telefone         char(11)
);

alter table Usuarios
   add primary key (cod_usuarios);

alter table Login add constraint FK_Cadastro_Login foreign key (cod_usuarios)
      references Usuarios (cod_usuarios) on delete restrict on update restrict;

alter table Perfil add constraint FK_Definir_Perfil foreign key (cod_usuarios)
      references Usuarios (cod_usuarios) on delete restrict on update restrict;

alter table Plantas add constraint FK_Associacao_Pefil_Plantas foreign key (cod_perfil)
      references Perfil (cod_perfil) on delete restrict on update restrict;

alter table Plantas add constraint FK_Cadastro_Plantas foreign key (cod_usuarios)
      references Usuarios (cod_usuarios) on delete restrict on update restrict;

alter table Regas add constraint FK_Cadastro_Regras foreign key (cod_planta)
      references Plantas (cod_planta) on delete restrict on update restrict;

alter table Regas add constraint FK_Perfil_Regas foreign key (cod_perfil)
      references Perfil (cod_perfil) on delete restrict on update restrict;

