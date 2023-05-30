drop table if exists users;
create table users (
  id integer primary key,
  name text,
  password text
);

-- あとでデータ型をtext→stringに変更する

insert into users (name, password) values ('name1', 'password1');
insert into users (name, password) values ('name2', 'password2');
insert into users (name, password) values ('name3', 'password3');
insert into users (name, password) values ('name4', 'password4');
