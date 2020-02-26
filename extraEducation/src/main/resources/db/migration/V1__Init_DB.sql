create table hibernate_sequence (
    next_val bigint
    );

insert into hibernate_sequence values ( 1 );
insert into hibernate_sequence values ( 1 );

create table school (
    id integer not null,
    filename varchar(255),
    name varchar(512),
    tag varchar(50),
    text varchar(8192),
    user_id bigint,
    primary key (id)
    );

create table user_role (
    user_id bigint not null,
    roles varchar(50)
    );

create table usr (
    id bigint not null,
    activation_code varchar(255),
    active bit not null,
    email varchar(50),
    first_name varchar(50),
    last_name varchar(50),
    password varchar(255),
    username varchar(50),
    number varchar(15),
    primary key (id)
    );

alter table school
    add constraint message_user_fk
    foreign key (user_id) references usr (id);

alter table user_role
    add constraint user_role_fk
    foreign key (user_id) references usr (id);