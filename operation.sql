-- SELECT * FROM anju_user;
-- insert into testpro.terminal(id,name,mac,ip)
-- values(default,'OPPW','48:01:c5:17:c4:69','192.168.177.116');

-- delete from user_has_terminal;
-- insert into user_has_terminal
-- value(default,1,1,default,default,default);
-- SELECT * FROM operationlog;

-- insert into operationlog
-- values(default,'删除设备',default,default,2,2);
-- select * from testpro.operationlog;
-- insert into user_has_terminal
-- values(default,2,3,default,default,default);

-- select log,create from operationlog
-- where operationlog.anju_user_id in 
-- (select id from anju_user
-- where anju_user.phone='18279430191'
-- );


-- select terminal.ip,terminal.name,operationlog.log,operationlog.create
-- from terminal,operationlog,anju_user
-- where operationlog.anju_user_id in 
-- (select id from anju_user
-- where anju_user.phone='15107949156'
-- )
-- join
-- operationlog.terminal_id=terminal.id;
-- select * from operationlog;

-- select terminal.ip,terminal.name,operationlog.log,operationlog.create
-- from terminal left join operationlog on terminal.id=operationlog.terminal_id
-- where operationlog.anju_user_id in 
-- (select id from anju_user
-- where anju_user.phone='15107949156'
-- );

-- SELECT * FROM terminal;
-- select * from user_has_terminal;

-- create trigger


-- create trigger AFTER_terminal_INSERT after insert on terminal
-- for each row
-- begin
-- 	insert into user_has_terminal
--     values(default,NEW.id,);
-- end;
-- select * from anju_user;
-- insert into terminal
-- values(default,'GALAXY S10 plus','44:00:d1:17:c5:63','192.168.49.169','15107949156','N');

-- insert into user_has_terminal
-- values(default,4,2,default,default,default);

-- select terminal.name,user_has_terminal.status,user_has_terminal.create
-- from terminal left join user_has_terminal on terminal.id=user_has_terminal.terminal_id
-- where user_has_terminal.anju_user_id in (
-- select id from anju_user
-- where anju_user.phone='15107949156'
-- ) and user_has_terminal.status='绑定';

-- select * from terminal;
-- select id from anju_user
-- where anju_user.phone='18279430191'

-- select * from anju_user;
-- select * from user_has_terminal;

-- INSERT INTO rel_users_demo (demo_ID,users_ID) 
-- SELECT demo.ID, users.ID join on demo.EMail = users.email



-- insert into operationlog(log,anju_user_id,terminal_id)
-- select '注销账户',anju_user.id,terminal.id
-- from anju_user,terminal
-- where anju_user.phone='15107941234' and terminal.phone='15107949156' and terminal.using='Y' ;


-- select * from terminal;

-- select * from terminal;

-- delete from operationlog
-- where anju_user_id=2;

-- delete from operationlog
-- where operationlog.anju_user_id =
-- (select id from anju_user
-- where anju_user.phone='18279430191'
-- );
-- select * from operationlog;

-- select * from anju_user;

-- update  
-- 	terminal set phone='15107941234' where phone='15107949156';
-- select *  from terminal;

-- insert into user_has_terminal(anju_user_id,terminal_id)
-- 	select anju_user.id, terminal.id 
-- 	from anju_user,terminal
-- 	where anju_user.phone=terminal.phone;
--     
-- select terminal.name,user_has_terminal.status,user_has_terminal.create,terminal.using
--  from terminal left join user_has_terminal on terminal.id=user_has_terminal.terminal_id
--  where user_has_terminal.anju_user_id in (
--  select id from anju_user
--  where anju_user.phone='15107949156'
--  ) and user_has_terminal.status='已绑定';

-- -- update user_has_terminal set status='' where status='绑定';

-- update user_has_terminal set status='已绑定' where  
-- anju_user_id in (select anju_user.id from anju_user where anju_user.phone='15107949156')
-- and terminal_id in (select terminal.id from terminal where terminal.using='N');
-- and terminal_id in (select terminal.id from terminal where using='N'); 

-- select * from user_has_terminal;
-- insert into user_has_terminal(anju_user_id,terminal_id)
-- 	select anju_user.id, terminal.id 
--     from anju_user,terminal
-- 	where anju_user.phone=terminal.phone;

-- -- delete from user_has_terminal;
-- -- delete from terminal;
-- select * from user_has_terminal;

-- 设置触发器,当用户添加设备时，中间表自动更新。

-- create trigger AFTER_terminal_INSERT after insert on terminal 
-- for each row
-- 	insert into user_has_terminal
--     values(default,new.id,
--     (select anju_user.id from anju_user where anju_user.phone=new.phone),
--     default,default,default);
-- select * from terminal;

-- insert into terminal
-- values(default,'Firefox','44:00:d1:17:c6:63','192.168.49.168','18279430191','N');

-- select * from user_has_terminal;

-- 设置触发器，当用户更改手机号时，终端表的手机号也自动更新。
-- drop trigger AFTER_anju_user_UPDATE;
-- create trigger AFTER_anju_user_UPDATE after update on anju_user
-- for each row
-- 	update terminal set terminal.phone=new.phone where terminal.phone=old.phone;

-- update anju_user set phone='15107949156' where phone='15107949151';

-- update terminal set phone='15107949156' where id != 12;

-- insert into terminal
-- values(default,'Oneplus 7','42:01:d2:17:c4:63','192.168.137.118','18279430199','Y');

-- update user_has_terminal set status='已绑定' where status='解绑';

-- select * from terminal;

-- select * from operationlog;

-- select * from operationlog;