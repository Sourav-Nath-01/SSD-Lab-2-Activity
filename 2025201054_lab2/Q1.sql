use campus;

drop procedure if exists ListAllSubscribers;

delimiter //
create procedure ListAllSubscribers()
begin
	declare flag int default 0;
    declare subsName varchar(50);
    
    declare cur cursor for
		select SubscriberName from Subscribers;
	declare  continue handler for not found set flag=1;
    
    open cur;
    
    read_loop:loop
		fetch cur into subsName;
        if flag=1 then 
			leave read_loop;
		end if;
        select subsName as SubscriberName;
	end loop;
    close cur;
end //
delimiter ;


call ListAllSubscribers();