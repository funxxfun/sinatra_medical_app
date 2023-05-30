drop table if exists users;
create table users (
  id integer primary key,
  name integer,
  password integer
);

insert into users (name, password) values ('name1', 'password1');
insert into users (name, password) values ('name2', 'password2');
