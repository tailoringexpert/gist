SELECT * 
  FROM IDENTIFIER_LIMITATION 
  WHERE IDENTIFIER_ID = (
    SELECT IDENTIFIER_ID 
      FROM IDENTIFIER 
      WHERE REQUIREMENT_ID = (
        SELECT REQUIREMENT_ID 
          FROM BASEREQUIREMENT 
          WHERE NUMBER = :NUMBER
      )
  )