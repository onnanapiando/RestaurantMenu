create table RestaurantMenu (
      RestaurantMenu_id int primary key,
     ordername text,
     size_ text
     price text
);

--create language plpgsql;
-- controller
create or replace 
    function setRestaurantMenu(p_RestaurantMenu_id int, p_ordername text,p_size_ text,price text) 
    returns text as
$$
  declare
     v_RestaurantMenu_id int;
  begin
      select into v_RestaurantMenu_id RestaurantMenu_id from RestaurantMenu 
         where RestaurantMenu_id= p_RestaurantMenu_id;
         
      if v_RestaurantMenu_id isnull then
          insert into RestaurantMenu(RestaurantMenu_id, ordername, size_ ,price) values
             (p_RestaurantMenu_id, p_ordername, p_size_, p_price);
      else
           update RestaurantMenu
           set ordername = p_ordername,size_ = p_size_, price = p_price
             where RestaurantMenu_id= p_RestaurantMenu_id;

      end if;   
         
      return 'OK';
  end;
$$
  language 'plpgsql'; 

--HOW TO USE:
--SELECT setleague(1,'Orange','Small', '3.25');

--view
create or replace function 
    get_RestaurantMenu_perid(in int, out text, out text,out text) 
returns setof record as
$$ 

     select ordername, size_  from RestaurantMenu
     where RestaurantMenu_id = $1;
     
$$
--HOW TO USE:
--select * from get_RestaurantMenu_perid(1);

 language 'sql';