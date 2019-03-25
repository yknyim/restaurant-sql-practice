insert into users 
	(first_name, last_name, email, password) 
values 
	('Ryan', 'Yim', 'ryanyim@email.com', 'abcd1234'),
	('Luis','Abad','luisabad@hisemail.com','1235abd'),
	('Jason','Lastname','jason@lastname.com','mypassword'),
	('Chris','Aquino','radismouse@dc4ever.com','ilikecats')
;

select * from users;

insert into restaurants 
	(name, address, street, state, phone, menu, picture) 
values 
	('AppleBees','3421 Apple Lane Atlanta, Georgia','3421 Apple Lane','Georgia','404-123-4567','www.applebeesfake.com/menu','url-picture'),
	('Chipotle','3421 Piedmont Park Buckhead, Georgia','3421 Piedmont Park','Georgia','404-213-2132','www.chiptoleok.com/menu','url-picture'),
	('Lovies','3422 Piedmont Park Buckhead, Georgia','3422 Piedmont Park','Georgia','404-242-1352','www.loviestuesday.com/menu','url-picture'),
	('DigitalCafe','3427 Piedmont Fantasy Buckhead, Georgia','3427 Piedmont Fantasy','Georgia','404-754-3467','www.dcafe.com/menu','url-picture')
;

select * from restaurants;

insert into reviews 
	(score, content, restaurant_id, user_id) 
values 
	(5, 'I hate this place', 3, 2),
	(4.5,'Best place ever', 2, 1),
	(2,'Love this place', 1, 3),
	(3,'Ehh okay', 4, 4)
;

select * from reviews;

insert into favorites 
	(restaurant_id, user_id) 
values 
	(1,3),
	(4,4),
	(2,1)
;

select * from favorites;
-- user profile
-- 1. get all info for a user by id
	select * from users where id=1;
    -- 1a. get only a few fields for public version
    select first_name, last_name from users where id=1;
    -- 1b. get all fields for private version
    select * from users where id=1;
-- 2. get all favorites for a user by id
	select * from favorites where user_id=1;
-- 3. get all reviews written by that user by id
	select * from reviews where user_id=1;

-- restaurant profile
-- 1. get all info for a restaurant by id
	select * from restaurants where id=1;
-- 2. get all reviews for restaurant by id
	select * from reviews where restaurant_id=1;
-- 3. get average review for a restaurant by id
	select avg(score) from reviews where restaurant_id=1;
-- 4. get count of favorites for restaurants by id
	select count(*) from favorites where restaurant_id=1;

-- restaurant search result (restaurants in Atlanta, GA)

-- 1a. get all matching rows for restaurant by name (case insensitive search)
	select name from restaurants where name ilike '%Chi%';
	
    -- 1b. include average review
  	select distinct r.name, AVG(s.score), s.content
  	
  		from restaurants r 
  		inner join reviews s 
  		on r.id = s.restaurant_id 
  
  	where name ilike '%Chi%'
  	group by r.name, s.score, s.content;
  	
  	
  	
    -- 1c. include number of favorites
    select r.name, AVG(s.score), s.content, count(fav.user_id)
  	
  		from restaurants r 
  		inner join reviews s 
  		on r.id = s.restaurant_id 
  
  	where name ilike '%Chi%'
  	group by r.name, s.score, s.content;
  	
-- 2. limit by mininum review
-- 3. (SUPER BONUS) pagination 