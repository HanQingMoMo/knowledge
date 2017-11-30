/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     2017/11/30 14:55:40                          */
/*==============================================================*/


drop table score;

drop table student_info;

drop table subject_info;

/*==============================================================*/
/* Table: score                                                 */
/*==============================================================*/
create table score (
   id                   INT4                 not null,
   sub_id               INT4                 not null,
   score                INT4                 not null,
   constraint PK_SCORE primary key (id, sub_id)
);

/*==============================================================*/
/* Table: student_info                                          */
/*==============================================================*/
create table student_info (
   name                 CHAR(20)             not null,
   id                   SERIAL not null,
   age                  INT4                 not null,
   sex                  CHAR(10)             not null,
   constraint PK_STUDENT_INFO primary key (id)
);

/*==============================================================*/
/* Table: subject_info                                          */
/*==============================================================*/
create table subject_info (
   name                 CHAR(20)             not null,
   id                   INT4                 not null,
   classHour            INT4                 not null,
   constraint PK_SUBJECT_INFO primary key (id)
);

alter table score
   add constraint FK_SCORE_REFERENCE_STUDENT_ foreign key (id)
      references student_info (id)
      on delete restrict on update restrict;

alter table score
   add constraint FK_SCORE_REFERENCE_SUBJECT_ foreign key (sub_id)
      references subject_info (id)
      on delete restrict on update restrict;

