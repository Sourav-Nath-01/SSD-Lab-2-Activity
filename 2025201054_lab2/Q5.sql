
use campus;

drop procedure if exists PrintAllSubscribersWatchHistory;

delimiter //
create procedure PrintAllSubscribersWatchHistory()
begin
	declare flag int default 0;
    declare subId int;
    
    declare cur cursor for
		select SubscriberID from Subscribers;
	declare  continue handler for not found set flag=1;
    
    open cur;
    
    read_loop:loop
		fetch cur into subId;
        if flag=1 then 
			leave read_loop;
		end if;
        CALL GetWatchHistoryBySubscriber(subId);
	end loop;
    close cur;
end //
delimiter ;


call PrintAllSubscribersWatchHistory();