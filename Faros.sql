create table subscribe(
subscribe_id int generated always as identity not null,									--subscribe
subscribe_status varchar(30) unique not null,

constraint subscribe_id_pk primary key (subscribe_id)
);

create table education_degree (
degree_id int generated always as identity not null,									-- education_degree
degree_name varchar(30) not null unique,

constraint degree_id_pk primary key (degree_id)
);

create table education_year (
year_id int generated always as identity not null,
year varchar (10) not null unique,																		-- education year

constraint year_id_pk primary key (year_id)
);

create table university (
university_id int generated always as identity not null,
university_name varchar (50) unique not null,											-- university

constraint university_id_pk primary key (university_id)

);

create table major (
major_id int generated always as identity not null,
major_name varchar (100) not null,
university_id int not null,
																								-- major (ixtisas)
constraint universityt_id_fk foreign key (university_id) references university(university_id)

);

create table locations (

location_id int generated always as identity not null,
latitude float unique,											-- location (universitetin filial adress lokaciyasi)
longitude float unique,

constraint location_id_pk primary key (location_id)

);

create table campus (
campus_id int generated always as identity not null,
university_id int not null,
campus_name varchar (100) not null,                      			--campus universitetin filial
location_id int not null,

constraint campus_id_pk primary key (campus_id),
constraint university_id_fk foreign key (university_id) references university(university_id),
constraint location_id_fk foreign key (location_id) references locations(location_id)
);

create table users (
user_id int generated always as identity not null,
first_name varchar(50) not null,											-- users 
last_name varchar(50) not null,
birth_date date not null,
mail varchar (50) not null unique,
password varchar (50) not null,
university_id int not null,
degree_id int not null,
year_id int not null,
subscribe_id int not null,

constraint user_id_pk primary key (user_id),
constraint university_id_fk foreign key (university_id) references university(university_id),
constraint degree_id_fk foreign key (degree_id) references education_degree(degree_id),
constraint year_id_fk foreign key (year_id) references education_year(year_id),
constraint subscribe_id_fk foreign key (subscribe_id) references subscribe(subscribe_id)
);

create table mentor (
mentor_id int generated always as identity not null,
mentor_name varchar (50) not null,
mentor_lastname varchar(50) not null,											-- mentor
mentor_linkedin varchar(50) not null unique,

constraint mentor_id_pk primary key (mentor_id)

);

create table categories (
category_id int generated always as identity not null,
category_name varchar(50),
																				-- event ne uzre olacag hansi kategoriyaya aid for example fizika ximiya math event (onlara aid)
constraint category_id_pk primary key (category_id)
);

create table event_level(
level_id int generated always as identity not null,
level_name varchar (10) not null unique,										-- event cetinlikliyi level olarag olacag meselen telebe ola bilerki 3 level kimi izah olunacag flan ve az bilen telebe onu hec basa duwen deyil

constraint level_id_pk primary key(level_id)
);

create table payment_status(
payment_status_id int generated always as identity not null,
payment_status varchar(30) not null unique,

constraint payment_status_id_pk primary key (payment_status_id)									-- odenis cancel olundu ve ya pending ve ya accept
);

create table ticket (
ticket_id int generated always as identity not null,
user_id int not null,
payment_date timestamp without time zone,
payment_status_id int,																																-- biletler 

constraint ticket_id_pk primary key (ticket_id),
constraint user_id_fk foreign key (user_id) references users(user_id),
constraint payment_status_id_fk foreign key (payment_status_id) references payment_status(payment_status_id)
);

create table credit_cards(
card_id int generated always as identity not null,
card_holder_name varchar(100) not null,
card_pan varchar(16) not null unique,
card_expiration_date date not null,
																							-- bank karti
constraint card_id_pk primary key (card_id)
);

create table event (
event_id int generated always as identity not null,
event_name varchar(100),
category_id int not null,
mentor_id int not null,
event_date timestamp without time zone not null,
event_duration varchar(3),
campus_id int not null,
event_ticket_price float not null,																					-- eventler
level_id int not null,
description varchar (255),

constraint event_id_pk primary key (event_id),
constraint category_id_fk foreign key (category_id) references categories(category_id),
constraint mentor_id_fk foreign key (mentor_id) references mentor(mentor_id),
constraint campus_id_fk foreign key (campus_id)references campus(campus_id),
constraint level_id_fk foreign key (level_id) references event_level(level_id)

);
