# **Triggers** and **Store Procedures**  

## **Triggers** list here

* **AFTER**\_anju\_user\_**UPDATE** :When user update his/her phone number, the phone number attribute in Terminal table will be changed as the same value.  

>code here:  

``` sql
{
    --设置触发器,当用户添加设备时，中间表自动更新。
    drop trigger if exists AFTER_terminal_INSERT;
    create trigger AFTER_terminal_INSERT after insert on terminal
    for each row
    insert into user_has_terminal values
    (
    default,default,default,default,
        (select anju_user.id from anju_user where   anju_user.phone=new.phone
        ),new.id
    );
}
```

* **AFTER**\_terminal\_**INSERT**:When user add new terminal, this trigger will update the **user**\_has\_**terminal** table which is a juction table maintains the relationship(_many_ to _many_) between the **user** and **terminal** table.  

>code here:  

```sql
{
    --设置触发器，当用户更改手机号时，终端表的手机号也自动更新。
    drop trigger if exists AFTER_anju_user_UPDATE;
    create trigger AFTER_anju_user_UPDATE after update on anju_user
    for each row
    update terminal set terminal.phone=new.phone where terminal.phone=old.phone;
}
```

* **AFTER**\_anju_user\_**DELETE**:When user delete his/her account, this trigger will remove his _terminal_ _operationlog_ _user\_has\_terminal _friend_ table data.

>code here:

``` sql
{
    drop trigger if exists AFTER_anju_user_DELETE;
    DELIMITER $$
    create trigger AFTER_anju_user_DELETE after delete
    on anju_user
    for each row
    begin
        delete from operationlog where operationlog.anju_user_id = old.id;
        delete from user_has_terminal where user_has_terminal.anju_user_id = old.id;
        delete from terminal where terminal.phone=old.phone;
        delete from friend where friend.anju_user_id = old.id or friend.anju_user_id1 = old.id;
    END$$
}
```
