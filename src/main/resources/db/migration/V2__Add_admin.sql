insert into usr(id, username, password, active, profession)
values (1, 'Chubrila', '$2a$08$Qgj51TimD8EHZt3qrUvBEeO.k.xKDRuWCQmbOe.4IkEMpBxOHIKPC', 1, 'Директор');

insert into user_role (user_id, roles)
    values(1,'USER'), (1,'ADMIN');
