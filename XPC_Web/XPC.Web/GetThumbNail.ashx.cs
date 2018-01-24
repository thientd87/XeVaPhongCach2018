using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Net;
using System.Web;
using System.Web.Services;
using BO;

namespace XPC.Web
{

    /// <summary>
    /// Summary description for $codebehindclassname$
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class GetThumbNail : IHttpHandler
    {
        enum AnchorPosition
        {
            Top,
            Center,
            Bottom,
            Left,
            Right
        }
        #region IHttpHandler Members
        string savedFolder = "ThumbImages";
        public void ProcessRequest(HttpContext context)
        {
            string imagePath = context.Request["ImgFilePath"];
            string width = context.Request["width"];
            
            BindData(context, imagePath, width);

            if (HttpContext.Current.Cache[imagePath] != null)
            {
                HttpContext.Current.Response.Redirect(HttpContext.Current.Cache[imagePath].ToString(), false);
                return;
            }

        }
        

        private void BindData(HttpContext context, string imagePath, string width)
        {
            //if (Convert.ToInt32(width) > 500) return;

            string[] fileThumbInfo = GetNameOfFileThumb(imagePath, width);
            string rootFolder = context.Server.MapPath("/" + savedFolder);
            string fileThumb = GetHTTPImages(fileThumbInfo[0]);
            if (!File.Exists(context.Server.MapPath("/" + savedFolder + "/" + fileThumb)))
            {
                string imageFile = "";
                Bitmap thumbBitmap = null;
                if (imagePath.IndexOf("http://") != -1)
                {
                    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(imagePath);
                    HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                    thumbBitmap = new Bitmap(response.GetResponseStream());
                }
                else
                {
                    try
                    {
                        imageFile = context.Server.MapPath(imagePath);
                        thumbBitmap = new Bitmap(imageFile);
                    }
                    catch
                    {
                        context.Response.Redirect("/NoImages/No.jpg", true);
                        return;
                    }
                }

                Directory.CreateDirectory(rootFolder + "/" + fileThumbInfo[1]);
                string fileThumbPath = rootFolder + "/" + fileThumb;
                Resize(thumbBitmap, fileThumbPath, Convert.ToInt32(width));

                string imageUrl = "/" + savedFolder + "/" + fileThumb.TrimStart('/');

                HttpContext.Current.Cache.Insert(imagePath, imageUrl, null, DateTime.Now.AddDays(3), TimeSpan.Zero);

                context.Response.Redirect(imageUrl, true);
            }
            else
            {
                string imageUrl = "/" + savedFolder + "/" + fileThumb.TrimStart('/');
                HttpContext.Current.Cache.Insert(imagePath, imageUrl, null, DateTime.Now.AddDays(3), TimeSpan.Zero);
                context.Response.Redirect(imageUrl, true);
            }
        }      

        public string Resize(Bitmap bmp, string strFileThumb, int P_Width)
        {
            string thumbnailFilePath = string.Empty;
            string FileName = string.Empty;

            try
            {
                float ratio = (float)bmp.Width / bmp.Height;
                int imgHeight = 0;
                //System.Drawing.Image img = Crop(bmp, P_Width, (int)(P_Width * ratio), AnchorPosition.Center);
               // int iz = HttpContext.Current.Request.QueryString["iz"] != null ? Convert.ToInt32(HttpContext.Current.Request.QueryString["iz"]) : 0;
                //switch (iz)
                {
                    //case 0 : 
                    //    //3x4
                    //    imgHeight = Convert.ToInt32( 0.75 * P_Width);
                    //    break;
                    //case 1:
                    //    //16x9
                    //    imgHeight = Convert.ToInt32((float)9 / 16 * P_Width);
                    //    break;
                   // default:
                        // normal:
                    imgHeight = Convert.ToInt32(P_Width / ratio);
                      //  break;
                }

                imgHeight = Convert.ToInt32((float)9 / 16 * P_Width);

                System.Drawing.Image img = Crop(bmp, P_Width + 1, imgHeight + 1, AnchorPosition.Center);
                using (Bitmap thumb = new Bitmap(img))
                {
                    //thumb.SetResolution(P_Width, P_Width);
                    using (Graphics g = Graphics.FromImage(thumb)) // Create Graphics object from original Image
                    {
                        g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                        g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;
                        g.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
                        //Set Image codec of JPEG type, the index of JPEG codec is "1"
                        System.Drawing.Imaging.ImageCodecInfo codec = System.Drawing.Imaging.ImageCodecInfo.GetImageEncoders()[1];
                        //Set the parameters for defining the quality of the thumbnail... here it is set to 100%
                        System.Drawing.Imaging.EncoderParameters eParams = new System.Drawing.Imaging.EncoderParameters(1);
                        eParams.Param[0] = new System.Drawing.Imaging.EncoderParameter(System.Drawing.Imaging.Encoder.Quality, 92L);
                        //Now draw the image on the instance of thumbnail Bitmap object
                        g.DrawImage(thumb, new Rectangle(0, 0, thumb.Width, thumb.Height));
                        thumb.Save(strFileThumb, codec, eParams);
                    }
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return FileName;
        }

        static Image Crop(Image imgPhoto, int Width, int Height, AnchorPosition Anchor)
        {
            int sourceWidth = imgPhoto.Width;
            int sourceHeight = imgPhoto.Height;
            int sourceX = 0;
            int sourceY = 0;
            int destX = 0;
            int destY = 0;

            float nPercent = 0;
            float nPercentW = 0;
            float nPercentH = 0;

            nPercentW = ((float)Width / (float)sourceWidth);
            nPercentH = ((float)Height / (float)sourceHeight);

            if (nPercentH < nPercentW)
            {
                nPercent = nPercentW;
                switch (Anchor)
                {
                    case AnchorPosition.Top:
                        destY = 0;
                        break;
                    case AnchorPosition.Bottom:
                        destY = (int)(Height - (sourceHeight * nPercent));
                        break;
                    default:
                        destY = (int)((Height - (sourceHeight * nPercent)) / 2);
                        break;
                }
            }
            else
            {
                nPercent = nPercentH;
                switch (Anchor)
                {
                    case AnchorPosition.Left:
                        destX = 0;
                        break;
                    case AnchorPosition.Right:
                        destX = (int)(Width - (sourceWidth * nPercent));
                        break;
                    default:
                        destX = (int)((Width - (sourceWidth * nPercent)) / 2);
                        break;
                }
            }

            int destWidth = (int)(sourceWidth * nPercent);
            int destHeight = (int)(sourceHeight * nPercent);

            Bitmap bmPhoto = new Bitmap(Width - 1, Height - 1, PixelFormat.Format24bppRgb);
            bmPhoto.SetResolution(imgPhoto.HorizontalResolution, imgPhoto.VerticalResolution);

            Graphics grPhoto = Graphics.FromImage(bmPhoto);
            grPhoto.Clear(Color.White);
            grPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;
            grPhoto.DrawImage(imgPhoto,
                new Rectangle(destX, destY, destWidth, destHeight),
                new Rectangle(sourceX, sourceY, sourceWidth, sourceHeight - 2),
                GraphicsUnit.Pixel);

            grPhoto.Dispose();
            return bmPhoto;
        }

        public string[] GetNameOfFileThumb(string imagePath, string width)
        {
            string[] ThumbFileInfo = new string[2];
            string fileNameOrgin = imagePath.Substring(imagePath.LastIndexOf('/') + 1); //FileName.Extension
            string[] fileName = new string[2];// fileNameOrgin.Split('.');
            fileName[1] = fileNameOrgin.Substring(fileNameOrgin.LastIndexOf(".") + 1);
            fileName[0] = fileNameOrgin.Substring(0, fileNameOrgin.LastIndexOf("."));
            string fileName_Thumb = fileName[0] + "_" + width + "." + fileName[1]; //FilenName_Width.Extension
            string folderName = "";
            imagePath = GetHTTPImages(imagePath);
            folderName = imagePath.Replace("/" + fileNameOrgin, "").Replace(" ", "").Replace("%20", "");
            

            string fileThumb = "/" + folderName.TrimStart('/') + "/" + fileName_Thumb; //Đường dẫn file Thumb
            ThumbFileInfo[0] = fileThumb;
            ThumbFileInfo[1] = folderName;
            return ThumbFileInfo;
        }

        private string GetHTTPImages(string str)
        {
            if ((str != null) && (str.ToLower().IndexOf("http://") != -1))
            {
                str = str.Substring(8);
                string[] temp = str.Split('/');
                str = String.Join("/", temp, 1, temp.Length - 1);
            }
            return str;
        }

        public bool IsReusable
        {
            get { return false; }
        }

        #endregion

        public bool ThumbCallback()
        {
            return false;
        }
    }
}