

ALTER proc [dbo].[Friends_SelectByIdV2]
		
		@Id int --parameter Id what we are trying to capture value


AS


/*
Declare @Id int = 54;
Execute dbo.Friends_SelectByIdV2 @Id

*/



BEGIN

SELECT 		f.Id
		,f.Title
		,f.Bio
		,f.Summary
		,f.Headline
		,f.Slug
		,f.StatusId
		,f.UserId
		,i.Id
		,i.TypeId
		,i.Url
						

From        dbo.Friends as f inner join dbo.Images as i
		
	
on 	   f.PrimaryImageId = i.Id  
		

where 	   f.Id= @Id 

END
