#1.Som säljare vill jag kunna skapa auktioner.

Replace INTO objects
  	VALUES(1, 1, 'cheap old cheese', 'best cheese in town', NOW(), NOW()+MAKETIME(1,00,00), 299, 599) ;


#2.Som säljare vill jag kunna ange namn, bild, beskrivning samt tidpunkter för börjar och slutar, på min auktion.

replace INTO objects
SET id = 3, seller = 1, description = 'A6', title = 'Audi', time_start =  NOW()+MAKETIME(3,00,00), time_end = NOW()+MAKETIME(5,00,00);


replace INTO pics
VALUES(1, 'http://dummyimage.com/217x125.png/5fa2dd/ffffff', 1);


replace INTO pics
VALUES(2, 'Cheese', 1);

#3.Som köpare vill jag kunna se alla pågående auktioner.

SELECT * FROM objects
	WHERE time_start < NOW() AND time_end > NOW();


#4.Som köpare vill jag kunna lägga bud på auktioner.

Replace INTO bids
VALUES (2,5000,3,1);


#5.Som köpare vill jag kunna se vem som är säljare av en auktion.

#CREATE VIEW seller_of_object AS
	SELECT name 
		FROM users 
			Inner JOIN objects
				ON objects.seller=users.id 
					WHERE objects.id=3;
		

#6.Som köpare vill jag kunna se vilka bud som kommit in på en auktion, med det senaste budet överst.

#CREATE VIEW bid_history_of_en_object AS
SELECT title, bid FROM objects
	INNER JOIN bids
		On bids.object_id=objects.id where objects.id=3
			ORDER BY bid DESC;


#7.Som säljare vill jag kunna ange ett reservationspris.

UPDATE objects
	SET price_reservation = 600000
		WHERE id=3;


#8.Som köpare vill jag kunna se om en auktion uppnått sitt reservationspris.

#CREATE view buyer_auction_reach_reservation_price AS

SELECT objects.*, bids.*, (objects.price_reservation <= bids.bid) AS reserve_met
	FROM objects,bids
		WHERE bids.object_id=objects.id
			AND bids.bid = (SELECT MAX(bids.bid) FROM bids WHERE bids.object_id=objects.id)
					GROUP BY objects.id;
		
	
#9.Som säljare vill jag kunna lägga min auktion i en kategori.

REPLACE INTO categories
	VALUES(3, 'Car', 3);



#10.Som köpare vill jag kunna se auktioner i olika kategorier.

#CREATE VIEW auction_categories AS

SELECT category, title, description, time_start, time_end, price_start, price_reservation
	FROM objects
		INNER JOIN categories
			ON objects.id= categories.object_id;



#11.Som säljare vill jag kunna bifoga flera bilder till varje objekt.

REPLACE INTO pics
VALUES(4,'car',2);




#12.Som köpare vill jag kunna ordna auktioner efter senast auktion börjar tid eller med de som går ut först, överst.

SELECT * FROM objects
	ORDER BY time_start DESC;
	
	SELECT * FROM objects
		WHERE time_end>NOW()
			ORDER BY time_end;



#13.Som säljare vill jag kunna se en lista på just mina auktioner ordnade efter deras senaste bud.


#CREATE VIEW seller_and_auctions_bid AS

SELECT title, bid, name
  FROM objects
  	INNER JOIN bids
  			ON objects.id= bids.object_id
  				INNER JOIN users
  					ON users.id=objects.seller
  						WHERE objects.seller = 1
  							ORDER BY bid DESC;
  							
  							
#14.Som köpare vill jag kunna se alla avslutade auktioner med eventuella senaste bud, ordnade efter avslutad tid.

#CREATE VIEW alla_avslutade_auktioner_senaste_bud AS 

SELECT objects.*, bids.*
	FROM objects,bids
		WHERE bids.object_id=objects.id
			AND bids.bid = (SELECT MAX(bids.bid) FROM bids WHERE bids.object_id=objects.id)
				AND time_end< NOW()
					GROUP BY objects.id
						ORDER BY time_end DESC;
						
