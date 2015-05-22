using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing; 
using System.Drawing.Imaging;

namespace CatTrang.vi_vn
{
    public partial class TextOnImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string imageFile =Server.MapPath( Request.QueryString["file"]);
            string textToWrite = "timviecsieutoc.com";// Request.QueryString["text"];

            //string imageFile = Server.MapPath("~/images/girlvn.jpg");         
            //string textToWrite = "AO DAI VIET NAM";  
         

            // Tạo đối tượng Bitmap truyền vào đường dẫn File ảnh         
            Bitmap myBitmap = new Bitmap(imageFile);         
            // Tạo đối tượng Graphic từ Bitmap         
            Graphics myGraphics = Graphics.FromImage(myBitmap);         
            // Định dạng Style         
            StringFormat myStringFormat = new StringFormat();         
            myStringFormat.Alignment = StringAlignment.Near;           
            myGraphics.TextRenderingHint = System.Drawing.Text.TextRenderingHint.AntiAlias;         
            Font myFont = new Font("Tahoma", 10, FontStyle.Regular);         
            Color fontColor = Color.Red;         
            SolidBrush myBrush = new SolidBrush(fontColor);           
            // Vẽ lại hình ảnh, chèn nội dung mới vào.         
            myGraphics.DrawString(textToWrite, myFont, myBrush, new Point(2, 2), myStringFormat);           
            // Xuất hình ảnh mới         
            Response.ContentType = "image/jpeg";         
            myBitmap.Save(Response.OutputStream, ImageFormat.Jpeg);           
            // Dùng code này nếu lưu ảnh vào ổ cứng của bạn.         
            // myBitmap.Save(Server.MapPath("~/images/aodai.jpg"));

            //Xem thêm tại: http://tuanitpro.com/asp-net-huong-dan-chen-chu-vao-hinh-anh

        }
    }
}