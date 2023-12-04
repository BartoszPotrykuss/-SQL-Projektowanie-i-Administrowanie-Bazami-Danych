DELIMITER //
CREATE PROCEDURE pension(INOUT konto varchar (28))
BEGIN
INSERT INTO banks (sender, iban_wn, title, customer, iban_ma, amount, mark) VALUES
((SELECT company from license),
(SELECT iban from license),
(select if(month(curdate())<10,concat("Składki ",'0',month(curdate()),"/",year(curdate())),concat("Składki
",month(curdate()),"/",year(curdate())))),
(SELECT last from staff where iban = konto),
(SELECT nrs from license),
(SELECT alpha+beta+gamma+e+delta+epsilon+a*1.8/100+a*2.45/100+a*0.10/100 FROM staff WHERE
iban = konto),
0);
END //
DELIMITER ;