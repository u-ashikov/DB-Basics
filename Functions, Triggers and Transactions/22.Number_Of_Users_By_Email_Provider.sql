CREATE PROCEDURE udp_NumberOfUsersForEmailProvider
AS
BEGIN
	SELECT
	ep.EmailProvider AS 'Email Provider',COUNT(ep.EmailProvider) AS 'Number of Users'
	FROM
	(SELECT
		SUBSTRING(u.Email,CHARINDEX('@',u.Email,1)+1,LEN(u.Email)) AS EmailProvider
		FROM Users AS u) AS ep
		GROUP BY ep.EmailProvider
		ORDER BY [Number of Users] DESC, [Email Provider]
END

EXEC udp_NumberOfUsersForEmailProvider