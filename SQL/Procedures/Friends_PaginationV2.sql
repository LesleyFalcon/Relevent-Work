

ALTER proc [dbo].[Friends_PaginationV2]

			@PageIndex int
			,@PageSize int
			
AS

/*

Execute dbo.Friends_PaginationV2 

*/


BEGIN


Declare                 @offSet int = @PageIndex * @PageSize



SELECT  
			f.Id
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
			,TotalCount = COUNT(1) OVER()



From   		      dbo.Friends as f inner join dbo.Images as i
         ON            f.PrimaryImageId = i.Id
ORDER BY               f.Id

		
OFFSET 		      @offSet Rows
Fetch Next 	      @PageSize Rows ONLY

END
