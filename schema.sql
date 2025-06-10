drop table if exists user;
drop table if exists entry;
drop table if exists participant;
drop table if exists entry_type;

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
    created_by integer not null,
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp,
    foreign key (entry_type) references entry_type(id),
    foreign key (created_by) references user(id)
);

create table participant (
    user_id integer not null,
    entry_id integer not null,
    foreign key (user_id) references user(id),
    foreign key (entry_id) references entry(id),
    unique (user_id, entry_id)
);

create table entry_type (
    id integer primary key autoincrement,
    name text not null unique
);
