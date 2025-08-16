use campus;

drop procedure if exists  GetWatchHistoryBySubscriber;
delimiter //
create procedure GetWatchHistoryBySubscriber(in sub_id int)
begin
	select sub.SubscriberName,s.showID,s.Title,wh.WatchTime from WatchHistory wh inner join Shows s on wh.ShowId=s.ShowId inner join Subscribers sub on wh.SubscriberID=sub.SubscriberID where wh.subscriberID=sub_id;
end //
delimiter ;
call GetWatchHistoryBySubscriber(5);
