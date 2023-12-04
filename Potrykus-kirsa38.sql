DELIMITER //
CREATE PROCEDURE kirsa()
BEGIN
SET @sesja := (SELECT name from kirsa where name LIKE CONCAT('EX', DATE_FORMAT(NOW(), '%m%d'),'%') ORDER BY name DESC LIMIT 1);
SET @licznik := (select (substring(@sesja,9,10)+1));
IF @licznik IS NULL THEN
SET @nowy := '001';
ELSEIF @licznik < 10 THEN
SET @nowy := CONCAT('00', @licznik);
ELSEIF @licznik >=10 THEN
SET @nowy := CONCAT('0', @licznik);
END IF;
SELECT @nowy;
END //
DELIMITER ;
