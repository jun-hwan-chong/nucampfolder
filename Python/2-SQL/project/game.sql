create table players (
    players_id serial primary key,
    players_email text unique not null,
    players_username text unique not null,
    players_password text not null,
    players_first_name text not null,
    players_last_name text not null
)

create table characters (
    characters_id serial primary key,
    characters_name text unique not null,
    players_id int not null
)

create table spirits (
    spirits_id serial primary key,
    spirits_name text unique not null,
    spirits_description text,
    characters_id int not null
)

create table items (
    items_id serial primary key,
    items_name text unique not null,
    items_description text not null
)

-- many to many table
create table characters_items (
    characters_id int not null,
    items_id int not null,
    primary key(characters_id, items_id)
)


-- contraints
alter table characters
add constraint fk_characters_players
foreign key (players_id)
references players

alter table spirits
add constraint fk_spirits_character
foreign key (characters_id)
references characters

alter table characters_items
add constraint fk_character_items_character
foreign key (characters_id)
references characters

alter table characters_items
add constraint fk_character_items_items
foreign key (items_id)
references items

--index
create index characters_index on characters(characters_name);