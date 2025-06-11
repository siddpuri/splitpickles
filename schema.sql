drop table if exists user;
drop table if exists entry;
drop table if exists log;
drop table if exists participant;
drop table if exists entry_type;
drop table if exists action_type;

create table user (
    id integer primary key autoincrement,
    name text not null unique,
    uuid text not null unique
);

create table entry (
    id integer primary key autoincrement,
    title text not null,
    entry_type integer not null,
    payer integer not null,
    amount real not null,
    foreign key (entry_type) references entry_type(id),
    foreign key (payer) references user(id)
);

create table log (
    id integer primary key autoincrement,
    author integer not null,
    action_type integer not null,
    timestamp datetime default current_timestamp,
    entry integer not null,
    title text not null,
    entry_type integer not null,
    payer integer not null,
    amount real not null,
    foreign key (author) references user(id)
    foreign key (entry) references entry(id),
    foreign key (entry_type) references entry_type(id),
    foreign key (payer) references user(id)
    foreign key (action_type) references action_type(id),
);

create table participant (
    entry integer not null,
    user integer not null,
    foreign key (entry) references entry(id),
    foreign key (user) references user(id),
    unique (entry, user)
);

create table entry_type (
    id integer primary key autoincrement,
    name text not null unique
);

create table action_type (
    id integer primary key autoincrement,
    name text not null unique
);

insert into entry_type (name) values ('Expense');
insert into entry_type (name) values ('Pickeball');

insert into action_type (name) values ('Create');
insert into action_type (name) values ('Update');
insert into action_type (name) values ('Delete');
insert into action_type (name) values ('Add Participant');
insert into action_type (name) values ('Remove Participant');
