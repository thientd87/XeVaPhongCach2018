-- Import Tin tức----
insert into NewsPublished(News_ID,Cat_ID,News_Title,News_Image,News_InitContent,News_Content,News_Status,News_PublishDate,News_Mode,News_ModifedDate,Extension4,News_isFocus)
select [id],116,title,'/Images/Uploaded/'+thumb,summary,content,3,dateadd(S, publish_date, '1970-01-01'),0,dateadd(S, update_at, '1970-01-01'),0,0 from news_videos
where category_id = 2 and [type] = 0

insert into News(News_ID,Cat_ID,News_Title,News_Image,News_InitialContent,News_Content,News_Status,News_PublishDate,News_Mode,News_ModifiedDate,Extension4,News_Author,News_Approver,News_isFocus)
select [id],116,title,'/Images/Uploaded/'+thumb,summary,content,3,dateadd(S, publish_date, '1970-01-01'),0,dateadd(S, update_at, '1970-01-01'),0,'admin','admin',0 from news_videos
where category_id = 2 and [type] = 0

insert into [Action](News_ID,Sender_ID,Comment_Title,CreateDate,ActionType,Reciver_ID)
select [id] ,'xephongcach_admin',N'xephongcach_admin xuất bản bài',dateadd(S, publish_date, '1970-01-01'),3,'xephongcach_admin' from news_videos
where category_id = 2 and [type] = 0
-- End Import Tin tức----

-- Import Xe máy----
insert into NewsPublished(News_ID,Cat_ID,News_Title,News_Image,News_InitContent,News_Content,News_Status,News_PublishDate,News_Mode,News_ModifedDate,Extension4,News_isFocus)
select [id],118,title,'/Images/Uploaded/'+thumb,summary,content,3,dateadd(S, publish_date, '1970-01-01'),0,dateadd(S, update_at, '1970-01-01'),0,0 from news_videos
where category_id = 3 and [type] = 0

insert into News(News_ID,Cat_ID,News_Title,News_Image,News_InitialContent,News_Content,News_Status,News_PublishDate,News_Mode,News_ModifiedDate,Extension4,News_Author,News_Approver,News_isFocus)
select [id],118,title,'/Images/Uploaded/'+thumb,summary,content,3,dateadd(S, publish_date, '1970-01-01'),0,dateadd(S, update_at, '1970-01-01'),0,'admin','admin',0 from news_videos
where category_id = 3 and [type] = 0

insert into [Action](News_ID,Sender_ID,Comment_Title,CreateDate,ActionType,Reciver_ID)
select [id] ,'xephongcach_admin',N'admin xuất bản bài',dateadd(S, publish_date, '1970-01-01'),3,'xephongcach_admin' from news_videos
where category_id = 3 and [type] = 0
-- End Import Xe máy----

-- Import Chia se----
insert into NewsPublished(News_ID,Cat_ID,News_Title,News_Image,News_InitContent,News_Content,News_Status,News_PublishDate,News_Mode,News_ModifedDate,Extension4,News_isFocus)
select [id],119,title,'/Images/Uploaded/'+thumb,summary,content,3,dateadd(S, publish_date, '1970-01-01'),0,dateadd(S, update_at, '1970-01-01'),0,0 from news_videos
where category_id = 7 and [type] = 0

insert into News(News_ID,Cat_ID,News_Title,News_Image,News_InitialContent,News_Content,News_Status,News_PublishDate,News_Mode,News_ModifiedDate,Extension4,News_Author,News_Approver,News_isFocus)
select [id],119,title,'/Images/Uploaded/'+thumb,summary,content,3,dateadd(S, publish_date, '1970-01-01'),0,dateadd(S, update_at, '1970-01-01'),0,'admin','admin',0 from news_videos
where category_id = 7 and [type] = 0

insert into [Action](News_ID,Sender_ID,Comment_Title,CreateDate,ActionType,Reciver_ID)
select [id] ,'xephongcach_admin',N'admin xuất bản bài',dateadd(S, publish_date, '1970-01-01'),3,'xephongcach_admin' from news_videos
where category_id = 7 and [type] = 0
-- End Import Chia se----



-- Import Nhân vật----
insert into NewsPublished(News_ID,Cat_ID,News_Title,News_Image,News_InitContent,News_Content,News_Status,News_PublishDate,News_Mode,News_ModifedDate,Extension4,News_isFocus)
select [id],120,title,'/Images/Uploaded/'+thumb,summary,content,3,dateadd(S, publish_date, '1970-01-01'),0,dateadd(S, update_at, '1970-01-01'),0,0 from news_videos
where category_id = 5 and [type] = 0

insert into News(News_ID,Cat_ID,News_Title,News_Image,News_InitialContent,News_Content,News_Status,News_PublishDate,News_Mode,News_ModifiedDate,Extension4,News_Author,News_Approver,News_isFocus)
select [id],120,title,'/Images/Uploaded/'+thumb,summary,content,3,dateadd(S, publish_date, '1970-01-01'),0,dateadd(S, update_at, '1970-01-01'),0,'admin','admin',0 from news_videos
where category_id = 5 and [type] = 0

insert into [Action](News_ID,Sender_ID,Comment_Title,CreateDate,ActionType,Reciver_ID)
select [id] ,'xephongcach_admin',N'admin xuất bản bài',dateadd(S, publish_date, '1970-01-01'),3,'xephongcach_admin' from news_videos
where category_id = 5 and [type] = 0
-- End Import Nhân vật----




-- Import Thử xe----
insert into NewsPublished(News_ID,Cat_ID,News_Title,News_Image,News_InitContent,News_Content,News_Status,News_PublishDate,News_Mode,News_ModifedDate,Extension4,News_isFocus)
select [id],121,title,'/Images/Uploaded/'+thumb,summary,content,3,dateadd(S, publish_date, '1970-01-01'),0,dateadd(S, update_at, '1970-01-01'),0,0 from news_videos
where category_id = 4 and [type] = 0

insert into News(News_ID,Cat_ID,News_Title,News_Image,News_InitialContent,News_Content,News_Status,News_PublishDate,News_Mode,News_ModifiedDate,Extension4,News_Author,News_Approver,News_isFocus)
select [id],121,title,'/Images/Uploaded/'+thumb,summary,content,3,dateadd(S, publish_date, '1970-01-01'),0,dateadd(S, update_at, '1970-01-01'),0,'admin','admin',0 from news_videos
where category_id = 4 and [type] = 0

insert into [Action](News_ID,Sender_ID,Comment_Title,CreateDate,ActionType,Reciver_ID)
select [id] ,'xephongcach_admin',N'admin xuất bản bài',dateadd(S, publish_date, '1970-01-01'),3,'xephongcach_admin' from news_videos
where category_id = 4 and [type] = 0
-- End Import Nhân vật----


-- Import Thử xe----
insert into NewsPublished(News_ID,Cat_ID,News_Title,News_Image,News_InitContent,News_Content,News_Status,News_PublishDate,News_Mode,News_ModifedDate,Extension4,News_isFocus)
select [id],121,title,'/Images/Uploaded/'+thumb,summary,content,3,dateadd(S, publish_date, '1970-01-01'),0,dateadd(S, update_at, '1970-01-01'),0,0 from news_videos
where category_id = 4 and [type] = 0

insert into News(News_ID,Cat_ID,News_Title,News_Image,News_InitialContent,News_Content,News_Status,News_PublishDate,News_Mode,News_ModifiedDate,Extension4,News_Author,News_Approver,News_isFocus)
select [id],121,title,'/Images/Uploaded/'+thumb,summary,content,3,dateadd(S, publish_date, '1970-01-01'),0,dateadd(S, update_at, '1970-01-01'),0,'admin','admin',0 from news_videos
where category_id = 4 and [type] = 0

insert into [Action](News_ID,Sender_ID,Comment_Title,CreateDate,ActionType,Reciver_ID)
select [id] ,'xephongcach_admin',N'admin xuất bản bài',dateadd(S, publish_date, '1970-01-01'),3,'xephongcach_admin' from news_videos
where category_id = 4 and [type] = 0
-- End Import Thử xe----



-- Import Show room----
insert into NewsPublished(News_ID,Cat_ID,News_Title,News_Image,News_InitContent,News_Content,News_Status,News_PublishDate,News_Mode,News_ModifedDate,Extension4,News_isFocus)
select [id],122,title,'/Images/Uploaded/'+thumb,summary,content,3,dateadd(S, publish_date, '1970-01-01'),0,dateadd(S, update_at, '1970-01-01'),0,0 from news_videos
where category_id = 6 and [type] = 0

insert into News(News_ID,Cat_ID,News_Title,News_Image,News_InitialContent,News_Content,News_Status,News_PublishDate,News_Mode,News_ModifiedDate,Extension4,News_Author,News_Approver,News_isFocus)
select [id],122,title,'/Images/Uploaded/'+thumb,summary,content,3,dateadd(S, publish_date, '1970-01-01'),0,dateadd(S, update_at, '1970-01-01'),0,'admin','admin',0 from news_videos
where category_id = 6 and [type] = 0

insert into [Action](News_ID,Sender_ID,Comment_Title,CreateDate,ActionType,Reciver_ID)
select [id] ,'xephongcach_admin',N'admin xuất bản bài',dateadd(S, publish_date, '1970-01-01'),3,'xephongcach_admin' from news_videos
where category_id = 7 and [type] = 0
-- End Import Show room----



-- Import Video----
insert into NewsPublished(News_ID,Cat_ID,News_Title,News_Image,News_InitContent,News_Content,News_Status,News_PublishDate,News_Mode,News_ModifedDate,Extension4,News_isFocus)
select [id],117,title,'/Images/Uploaded/'+thumb,summary,link_video,3,dateadd(S, publish_date, '1970-01-01'),0,dateadd(S, update_at, '1970-01-01'),0,0 from news_videos
where category_id = 1 and [type] = 1

insert into News(News_ID,Cat_ID,News_Title,News_Image,News_InitialContent,News_Content,News_Status,News_PublishDate,News_Mode,News_ModifiedDate,Extension4,News_Author,News_Approver,News_isFocus)
select [id],117,title,'/Images/Uploaded/'+thumb,summary,link_video,3,dateadd(S, publish_date, '1970-01-01'),0,dateadd(S, update_at, '1970-01-01'),0,'admin','admin',0 from news_videos
where category_id = 1 and [type] = 1

insert into [Action](News_ID,Sender_ID,Comment_Title,CreateDate,ActionType,Reciver_ID)
select [id] ,'xephongcach_admin',N'admin xuất bản bài',dateadd(S, publish_date, '1970-01-01'),3,'xephongcach_admin' from news_videos
where category_id = 1 and [type] = 1
-- End Import Video----


Go




-- Update default value----
update News set News_ModifiedDate = News_PublishDate where News_ModifiedDate is null
update News set News_isFocus = 0 where News_isFocus is null
-- End Update default value----

Go

Create procedure [dbo].[Web_SelectProductNoiBatMuc]
(
	@Top int

)
as
SELECT top(@Top) p.*,C.Product_Category_Name,C.Product_Category_Name_En,C.Product_Category_CatParent_ID 								
		FROM [Products] AS P INNER JOIN Product_Category AS C ON P.ProductCategory = C.ID
		WHERE	P.ProductType = 1
		order by P.Id DESC
