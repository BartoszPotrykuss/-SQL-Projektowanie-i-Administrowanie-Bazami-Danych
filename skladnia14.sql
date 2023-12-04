DELIMITER //
CREATE PROCEDURE salary(INOUT konto varchar(28))
BEGIN
INSERT
INTO
banks
(sender, iban_wn, title, customer, iban_ma, amount, mark)
VALUES
((SELECT company from license),
(SELECT iban from license),
(select if(month(curdate())<10,concat("Wynagrodzenie",'0',month(curdate()),"/",year(curdate())),concat("Wynagrodzenie ",month(curdate()),"/",year(curdate())))),
(SELECT last from staff where iban = konto),
(SELECT iban from staff where iban = konto),
(SELECT i FROM staff WHERE iban = konto),
0);
END //
DELIMITER ;











DELIMITER //
CREATE TRIGGER cash
AFTER UPDATE ON staff FOR EACH ROW
BEGIN
IF NEW.mark = '1' THEN SELECT OLD.iban into @iban; CALL salary(@iban);
ELSEIF
NEW.mark = '2' THEN SELECT OLD.iban into @iban; CALL pension(@iban);
END IF;
END //
DELIMITER ;





