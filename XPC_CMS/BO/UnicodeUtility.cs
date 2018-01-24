﻿using System;
using System.Security.Cryptography;
using System.Text;
namespace DFISYS.BO
{

	public class UnicodeUtility {

		public UnicodeUtility() {
		}

	    public const string keywords ="";
		public static string UnicodeToWindows1252(string s)
		{
			string retVal = String.Empty;
			for (int i = 0; i < s.Length; i++)
			{
				int ord = (int)s[i];
				if (ord > 191)
					retVal += "&#" + ord.ToString() + ";";
				else
					retVal += s[i];
			}
			return retVal;
		}
		public static string MD5Encrypt(string plainText) 
		{
			byte[] data, output;
			UTF8Encoding encoder = new UTF8Encoding();
			MD5CryptoServiceProvider hasher = new MD5CryptoServiceProvider();

			data = encoder.GetBytes(plainText);
			output = hasher.ComputeHash(data);

			return BitConverter.ToString(output).Replace("-","").ToLower();
		}
		public static int UnicodeToUTF8(byte[] dest, int maxDestBytes, string source, int sourceChars) {
			int i,count;
			int c, result;

			result = 0;
			if (source == String.Empty) 
				return result;
			count = 0;
			i = 0;
			if (dest != null) {
				while ((i < sourceChars) && (count < maxDestBytes)) {
					c = (int)source[i++];
					if (c <= 0x7F) 
						dest[count++] = (byte)c;
					else if (c > 0x7FF) {
						if ((count+3) > maxDestBytes) 
							break;
						dest[count++] = (byte)(0xE0 | (c >> 12));
						dest[count++] = (byte)(0x80 | ((c >> 6) & 0x3F));
						dest[count++] = (byte)(0x80 | (c & 0x3F)); 
					}
					else {
						//  0x7F < source[i] <= 0x7FF
						if ((count+2) > maxDestBytes) 
							break;
						dest[count++] = (byte)(0xC0 | (c >> 6));
						dest[count++] = (byte)(0x80 | (c & 0x3F));
					}
				}
				if (count >= maxDestBytes) 
					count = maxDestBytes - 1;
				dest[count] = (byte)(0);
			}
			else { 
				while (i < sourceChars) {
					c = (int)(source[i++]);
					if (c > 0x7F) {
						if (c > 0x7FF) 
							count++;
						count++;
					}
					count++;
				}
			}
			result = count+1;
			return result;
		}


		public static int UTF8ToUnicode(char[] dest, int maxDestChars, byte[] source, int sourceBytes) {
			int i,count;
			int c,result;
			int wc;

			if (source == null) {
				result = 0;
				return result;
			}
			result = (int)(-1);
			count = 0;
			i = 0;
			if (dest != null) {
				while ((i < sourceBytes) && (count < maxDestChars)) {
					wc = (int)(source[i++]);
					if ((wc & 0x80) != 0) {
						if (i >= sourceBytes) 
							return result;
						wc = wc & 0x3F;
						if ((wc & 0x20) != 0) {
							c = (byte)(source[i++]);
							if ((c & 0xC0) != 0x80) 
								return result;
							if (i >= sourceBytes) 
								return result;
							wc = (wc << 6) | (c & 0x3F);
						}
						c = (byte)(source[i++]);
						if ((c & 0xC0) != 0x80) 
							return result;
						dest[count] = (char)((wc << 6) | (c & 0x3F));
					}
					else
						dest[count] = (char)wc;
					count++;
				}
				if (count > maxDestChars) 
					count = maxDestChars-1;
				dest[count] = (char)(0);
			}
			else {
				while (i < sourceBytes) {
					c = (byte)(source[i++]);
					if ((c & 0x80) != 0) {
						if (i >= sourceBytes) 
							return result;
						c = c & 0x3F;
						if ((c & 0x20) != 0) {
							c = (byte)(source[i++]);
							if ((c & 0xC0) != 0x80)
								return result;
							if (i >= sourceBytes)
								return result;
						}
						c = (byte)(source[i++]);
						if ((c & 0xC0) != 0x80)
							return result;
					}
					count++;
				}
			}
			result = count+1;
			return result;
		}


		public static byte[] UTF8Encode(string ws) {
			int l;
			byte[] temp, result;
			
			result = null;
			if (ws == String.Empty)
				return result;
			temp = new byte[ws.Length*3];
			l = UnicodeToUTF8(temp, temp.Length+1, ws, ws.Length);
			if (l > 0 ) {
				result = new byte[l-1];
				Array.Copy(temp, 0, result, 0, l-1);
			}
			else {
				result = new byte[ws.Length];
				for (int i=0; i < result.Length; i++) 
					result[i] = (byte)(ws[i]);
			}
			return result;
		}


		public static string UTF8Decode(byte[] s) {
			int l;
			char[] temp;
			string result;

			result = String.Empty;
			if (s == null) 
				return result;
			temp = new char[s.Length+1];
			l = UTF8ToUnicode(temp, temp.Length, s, s.Length);
			if (l > 0) {
				result = "";
				for (int i=0; i<l-1; i++) 
					result += temp[i];
			}
			else {
				result = "";
				for (int i=0; i<s.Length; i++) 
					result += (char)(s[i]);
			}
			return result;
		}
	
		public const string uniChars = 
			"àáảãạâầấẩẫậăằắẳẵặèéẻẽẹêềếểễệđìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵÀÁẢÃẠÂẦẤẨẪẬĂẰẮẲẴẶÈÉẺẼẸÊỀẾỂỄỆĐÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴÂĂĐÔƠƯ"; 

		public const string KoDauChars = 
			"aaaaaaaaaaaaaaaaaeeeeeeeeeeediiiiiooooooooooooooooouuuuuuuuuuuyyyyyAAAAAAAAAAAAAAAAAEEEEEEEEEEEDIIIOOOOOOOOOOOOOOOOOOOUUUUUUUUUUUYYYYYAADOOU"; 

		public static string UnicodeToKoDau(string s) 
		{ 
			string retVal = String.Empty; 
			int pos; 
			for (int i=0; i<s.Length; i++) 
			{ 
				pos = uniChars.IndexOf(s[i].ToString()); 
				if (pos >= 0) 
					retVal += KoDauChars[pos]; 
				else 
					retVal += s[i]; 
			} 
			return retVal; 
		}

        public static string UnicodeToKoDauAndGach(string s)
        {
            string retVal = String.Empty;
            int pos;
            for (int i = 0; i < s.Length; i++)
            {
                pos = uniChars.IndexOf(s[i].ToString());
                if (pos >= 0)
                    retVal += KoDauChars[pos];
                else
                    retVal += s[i];
            }
            retVal = retVal.Replace("-", "");
            retVal = retVal.Replace("  ", "");
            retVal = retVal.Replace(" ", "-");
            retVal = retVal.Replace("--", "-");
            retVal = retVal.Replace(":", "");
            retVal = retVal.Replace(";", "");
            retVal = retVal.Replace("+", "");
            retVal = retVal.Replace("@", "");
            retVal = retVal.Replace(">", "");
            retVal = retVal.Replace("<", "");
            retVal = retVal.Replace("*", "");
            retVal = retVal.Replace("{", "");
            retVal = retVal.Replace("}", "");
            retVal = retVal.Replace("|", "");
            retVal = retVal.Replace("^", "");
            retVal = retVal.Replace("~", "");
            retVal = retVal.Replace("]", "");
            retVal = retVal.Replace("[", "");
            retVal = retVal.Replace("`", "");
            retVal = retVal.Replace(".", "");
            retVal = retVal.Replace("'", "");
            retVal = retVal.Replace("(", "");
            retVal = retVal.Replace(")", "");
            retVal = retVal.Replace(",", "");
            retVal = retVal.Replace("”", "");
            retVal = retVal.Replace("“", "");
            retVal = retVal.Replace("?", "");
            retVal = retVal.Replace("\"", "");
            retVal = retVal.Replace("&", "");
            retVal = retVal.Replace("$", "");
            retVal = retVal.Replace("#", "");
            retVal = retVal.Replace("_", "");
            retVal = retVal.Replace("=", "");
            retVal = retVal.Replace("%", "");
            retVal = retVal.Replace("…", "");
            retVal = retVal.Replace("/", "");
            retVal = retVal.Replace("\\", "");
            return retVal;
        }

		public static string ConvertToJavascriptString(string input)
		{
			input = input.Replace("'", "\\'");
			input = input.Replace("\"", "\\u0022");
			return input;
		}	
	}

}