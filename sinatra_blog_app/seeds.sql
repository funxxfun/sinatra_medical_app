drop table if exists users;
create table users (
  id integer primary key,
  name text
);

insert into users (name) values ('name1');
insert into users (name) values ('name2');
