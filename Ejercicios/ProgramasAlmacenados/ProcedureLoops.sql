
drop procedure UsoWhile;

delimiter //
create procedure UsoWhile()
begin
	declare cont int default 1;
	declare s varchar(100) default '';
    
    while cont <=5 do
		set s = concat(s,'count= ' ,cont,'|');
		set cont=cont +1;
	end while;	
    select s as mensaje;
end //
delimiter ;

call UsoWhile;


drop procedure if exists UsoRepeat;

delimiter //
create procedure UsoRepeat()
begin
	declare cont int default 1;
	declare s varchar(100) default '';
    
    repeat
		set s = concat(s,'count= ' ,cont,'|');
		set cont=cont +1;
	until cont=5
	end repeat;	
    select s as mensaje;
end //
delimiter ;
call UsoRepeat;

drop procedure if exists UsoLoop;
delimiter //
create procedure UsoLoop()
begin
	declare cont int default 1;
	declare s varchar(100) default '';
	declare testLoop varchar(10);

	testLoop: LOOP 
		set s = concat(s,'count= ' ,cont,'|');
		set cont=cont +1;
		if cont=4 then
			LEAVE testLoop;
        end if;
    end loop testLoop;
    select s as mensaje;
end //
delimiter ;
call UsoLoop;
