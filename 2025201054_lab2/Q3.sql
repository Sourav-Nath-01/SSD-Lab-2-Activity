use campus;

drop procedure if exists AddSubscriberIfNotExists;
delimiter //
create procedure AddSubscriberIfNotExists(IN subName VARCHAR(100)) 
begin
	declare nextId int;
	select ifnull(max(SubscriberId),0)+ 1 into nextId from Subscribers;
	if not exists (select 1 from Subscribers where SubscriberName=subName) then 
		insert into Subscribers(Subscriberid,SubscriberName,SubscriptionDate) values (nextId,subname,curdate());
	end if;
end //

delimiter ;

call AddSubscriberIfNotExists('Sourav');
