DELIMITER //
CREATE PROCEDURE kirsa()
BEGIN
SET @sesja := (SELECT name from kirsa where name LIKE CONCAT('EX', DATE_FORMAT(NOW(), '%m%d'),'%') ORDER BY name DESC LIMIT 1);
SET @licznik := (select (substring(@sesja,9,10)+1));
SET @prefix := "EX";
SET @folder := "/var/lib/mysql-files/";
SET @mad := DATE_FORMAT(NOW(), '%m%d');
SET @syntax_1 :=
CONCAT
("
select sender, iban_wn, title, customer, iban_ma, amount from banks where mark = 0
INTO OUTFILE '"
,@folder, @prefix, @mad,
 "."
,@nowy,"'
FIELDS ENCLOSED BY '\"'
TERMINATED BY ';'
ESCAPED BY '\"'
LINES TERMINATED BY '\r\n'
");
IF @licznik IS NULL THEN
SET @nowy := '001';
ELSEIF @licznik < 10 THEN
SET @nowy := CONCAT('00', @licznik);
ELSEIF @licznik >=10 THEN
SET @nowy := CONCAT('0', @licznik);
END IF;
PREPARE statement FROM @syntax_1;
EXECUTE statement;
DEALLOCATE PREPARE statement;
SELECT @nowy;
END //
DELIMITER ;