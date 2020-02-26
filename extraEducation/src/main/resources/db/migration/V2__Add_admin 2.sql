insert into usr (id, username, password, first_name, last_name, number, active)
    values (0, 'admin', '$2y$08$4uW7lrMn3quP3p6CpMqjwuS/bdjHNJ8eE3We4rBURnbCiZ5JSirLG', 'admin', 'admin', '-', true);

insert into user_role (user_id, roles)
    values (0, 'USER'), (0, 'ADMIN');
