-- Add a new column in the Games table to track the ID of the file the user uploaded for that game so we can associate them and display the game photo on the game details page:
 ALTER TABLE Games
 Add GamePhotoId int null

 select *
 from Games

 select *
 from Files