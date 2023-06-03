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


insert into posts (title, body, created_at, updated_at) values ('タイトル1', '投稿1', '2023.06.01', '2024.06.01');
insert into posts (title, body, created_at, updated_at) values ('タイトル2', '投稿2', '2023.06.01', '2024.06.01');
insert into posts (title, body, created_at, updated_at) values ('タイトル3', '投稿3', '2023.06.01', '2024.06.01');
insert into posts (title, body, created_at, updated_at) values ('タイトル4', '投稿4', '2023.06.01', '2024.06.01');

