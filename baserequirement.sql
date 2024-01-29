-- Select a requirement of a dedicated base catalog 
WITH RECURSIVE
br AS (
    SELECT CHAPTER_ID, PARENTCHAPTER_ID, NAME
        FROM BASECATALOGCHAPTER
        WHERE CHAPTER_ID = (
            SELECT CHAPTER_ID
                FROM BASECATALOG
                WHERE VERSION = :VERSION
        )
    UNION ALL
    SELECT b.CHAPTER_ID, b.PARENTCHAPTER_ID, b.NAME
        FROM BASECATALOGCHAPTER b
        JOIN br ON b.PARENTCHAPTER_ID = br.CHAPTER_ID
)
Select * from BASEREQUIREMENT where NUMBER = :NUMBER and CHAPTER_ID in (select CHAPTER_ID from br)
