using System;
using System.Collections.Specialized;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Caching;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Portal.BO.Common
{
    public class Const
    {
        //News_Mode
        public const int TIN_THUONG = 0;
        public const int TIN_NOI_BAT_TRANG_CHU = 2;
        public const int TIN_NOI_BAT_TRONG_MUC = 1;
        public const int TIN_TIEU_DIEM = 1;
        
        //News_Status
        public const int TRANG_THAI_TIN_DUOC_DANG = 3;
        public const int TRANG_THAI_TIN_BI_GO = 5; //TIN BỊ GỠ
        
        //Header
        public const string MENU_HOME = "home";
        public const string MENU_STAR = "star";
        public const string MENU_LIFE = "life";
        public const string MENU_MUSIK = "music";
        public const string MENU_FASHION = "fashion";
        public const string MENU_LOGIN = "login";
        public const string MENU_REGISTER = "register";
        public const string MENU_CINE = "cine";

        //Content
        public const string CHI_TIET_TIN = "newsdetail";
        //Rank MUSIC
        public const int RANK_MUSIC_LEFT = 1;
        public const int RANK_MUSIC_RIGHT = 2;

        //Status Rank
        public const string GIAM_RANK = "-1";
        public const string GIU_NGUYEN = "0";
        public const string TANG_RANK = "1";
        public const string NEW_RANK = "2";

        public const int CAT_MUSIC = 3;
        public const int CAT_FASION = 5;
        public const int CAT_TIEUDIEM_FASHION = 22;

        public const int NumberOfShoppingFocus=3;

        public const int NumberOfStyleUpVote = 8;
        public const int NumberOfPreviousMonthStyleUpVote = 3;
        public const int NumberOfShowedCatIcon = 3;
        public const int NumberOfOtherFilm = 10;

        public const double VOTE_PROGRESS_BAR_LENGTH = 100;

        public const string FILM_ID = "FILM_ID";
        public const string table_NewsPublished = "NewsPublished";
        public const string table_Category = "Category";
        public const string table_Cinema = "Cinema";
        public const string table_City = "City";
        public const string table_Comment = "Comment";
        public const string table_Film = "Film";
        public const string table_Music = "Music";
        public const string table_Music_Rank = "Music_Rank";
        public const string table_Music_RankTable = "Music_RankTable";
        public const string table_Rank = "Rank";
        public const string table_Schedule = "Schedule";
        public const string table_Singer_Profile = "Singer_Profile";
        public const string table_Styless_Persion = "Styless_Persion";
        public const string table_VTV = "VTV";
        public const string table_MediaObject = "MediaObject";
        public const string table_VoteItem = "VoteItem";
        public const string table_Vote_Assign = "Vote_Assign";
        public const string table_Vote = "Vote";

        public string DATABASE_NAME = "";
    }
    public class Utils
    {
        public static string DATABASE_NAME = System.Configuration.ConfigurationSettings.AppSettings["CoreDb"].ToString();
        public Utils()
        {
        }
        public static string THUMBNAIL_LINK(String ImagePath, int ImageWidthSize)
        {
            string _path="";
            _path = @"Thumbnail.Ashx?ImgFilePath=/";
            _path += ImagePath;
            _path += "&width=" + ImageWidthSize;
            return _path;
        }
        /// <summary>
        /// Đưa dữ liệu vào cache
        /// </summary>
        /// <param name="dataTableToCache">dữ liệu cần đưa</param>
        /// <param name="cacheName">tên cache</param>
        /// <param name="tableNameInDatabase">tên bảng trong DB</param>
        public static void SetDataToCache(DataTable dataTableToCache, string cacheName, string tableNameInDatabase)
        {
            SqlCacheDependency sqlDependency = new SqlCacheDependency(DATABASE_NAME, tableNameInDatabase);
            HttpContext.Current.Cache.Insert(cacheName, dataTableToCache, sqlDependency, DateTime.Now,TimeSpan.Zero);
        }
        public static void SetDataToCache(int dataToCache, string cacheName, string tableNameInDatabase)
        {
            SqlCacheDependency sqlDependency = new SqlCacheDependency(DATABASE_NAME, tableNameInDatabase);
            HttpContext.Current.Cache.Insert(cacheName, dataToCache, sqlDependency, DateTime.Now.AddDays(1), Cache.NoSlidingExpiration);
        }
        public static void SetDataToCache(string dataToCache, string cacheName, string tableNameInDatabase)
        {
            SqlCacheDependency sqlDependency = new SqlCacheDependency(DATABASE_NAME, tableNameInDatabase);
            HttpContext.Current.Cache.Insert(cacheName, dataToCache, sqlDependency, DateTime.Now.AddDays(1), Cache.NoSlidingExpiration);
        }
        public static void SetDataToCache(DataTable[] dataToCache, string cacheName, string tableNameInDatabase)
        {
            SqlCacheDependency sqlDependency = new SqlCacheDependency(DATABASE_NAME, tableNameInDatabase);
            HttpContext.Current.Cache.Insert(cacheName, dataToCache, sqlDependency, DateTime.Now.AddDays(1), Cache.NoSlidingExpiration);
        }
        public static void SetDataToCache(DataSet dataToCache, string cacheName, string tableNameInDatabase)
        {
            SqlCacheDependency sqlDependency = new SqlCacheDependency(DATABASE_NAME, tableNameInDatabase);
            HttpContext.Current.Cache.Insert(cacheName, dataToCache, sqlDependency, DateTime.Now.AddDays(1), Cache.NoSlidingExpiration);
        }

        public static void SetCache(DataTable dataCache, string cacheName, string[] tableNameInDatabase)
        {
            //System.Web.Caching.SqlCacheDependency sqlDep1 = new System.Web.Caching.SqlCacheDependency(Const.DATABASE_NAME, "tblTradeTransaction");
            //System.Web.Caching.SqlCacheDependency sqlDep2 = new System.Web.Caching.SqlCacheDependency(Const.DATABASE_NAME, "tblRemainTransaction");
            System.Web.Caching.SqlCacheDependency[] sqlDep = new SqlCacheDependency[tableNameInDatabase.Length];
            for (int i = 0; i < tableNameInDatabase.Length; i++)
            {
                sqlDep[i] = new System.Web.Caching.SqlCacheDependency(DATABASE_NAME, tableNameInDatabase[i]);
            }
            System.Web.Caching.AggregateCacheDependency agg = new System.Web.Caching.AggregateCacheDependency();
            //agg.Add(sqlDep1, sqlDep2);
            agg.Add(sqlDep);
            HttpContext.Current.Cache.Insert(cacheName, dataCache, agg, DateTime.Now.AddDays(1), Cache.NoSlidingExpiration);

        }

        
        /// <summary>
        /// lấy dữ liệu từ cache ra
        /// </summary>
        /// <param name="cacheName">tên cache</param>
        /// <returns></returns>
        public static DataTable GetFromCache(string cacheName)
        {
            return HttpContext.Current.Cache[cacheName] as DataTable;
        }
        public static int GetInt32FromCache(string cacheName)
        {
            return (int)HttpContext.Current.Cache[cacheName];
        }
        public static string GetStringFromCache(string cacheName)
        {
            return (string)HttpContext.Current.Cache[cacheName];
        }
        public static DataTable[] GetFromCacheAsTableArray(string cacheName)
        {
            return (DataTable[])HttpContext.Current.Cache[cacheName];
        }
        public static DataSet GetFromCacheAsDataSet(string cacheName)
        {
            return (DataSet)HttpContext.Current.Cache[cacheName];
        }
    }
}
