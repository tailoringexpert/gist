-- Select a requirement of a dedicated project tailoring
WITH RECURSIVE
tr AS (
    SELECT CHAPTER_ID, PARENTCHAPTER_ID, NAME 
  	    FROM TAILORINGCATALOGCHAPTER 
  	    WHERE CHAPTER_ID = (
  	        SELECT CHAPTER_ID 
  	            FROM TAILORINGCATALOG 
  	            WHERE CATALOG_ID = (
  	                SELECT TAILORINGCATALOG_ID 
  	                    FROM TAILORING 
  	                    WHERE NAME = :NAME AND PROJECT_ID = (
  	                        SELECT PROJECT_ID 
  	                            FROM PROJECT 
  	                            WHERE IDENTIFIER = :IDENTIFIER
  	                    )
  	            )
        )
    UNION ALL
    SELECT t.CHAPTER_ID, t.PARENTCHAPTER_ID, t.NAME 
  	    FROM TAILORINGCATALOGCHAPTER t
  	    JOIN tr ON t.PARENTCHAPTER_ID = tr.CHAPTER_ID
)
Select * from TAILORINGREQUIREMENT where NUMBER = :NUMBER and CHAPTER_ID in (select CHAPTER_ID from tr)
