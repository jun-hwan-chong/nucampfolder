create table account (
    account.id serial primary key,
    account.email text unique not null,
    account.username text unique not null,
    account.password text not null,
    account.first_name text not null,
    account.last_name text not null,
    account.active_status text not null
)

create table character (
    character.id serial primary key
)
