

ALTER proc [dbo].[Friends_Search_PaginationV2]
			
		       @PageIndex int
		      ,@PageSize int
		      ,@Query nvarchar(50) 


AS


/*
DECLARE               @PageIndex int = 0
	              ,@PageSize int = 10
                      ,@Query nvarchar(500) = 'James'

EXEC [dbo].[Friends_Search_PaginationV2] 

		      @PageIndex 
		     ,@PageSize
		     ,@Query
*/


 BEGIN

    
Declare             @offset int = @PageIndex * @PageSize


--To see result, highlight select till ON
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


FROM         dbo.Friends as f inner join dbo.Images as i
		
  ON         f.PrimaryImageId = i.Id

WHERE        f.Title LIKE  @Query + '%'


   
ORDER BY     f.Id
Offset       @offSet Rows
Fetch Next   @PageSize Rows ONLY



END
