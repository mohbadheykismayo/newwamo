using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Jose;
using Microsoft.Ajax.Utilities;
using static waamowaste.myincome;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Runtime.InteropServices;
using System.Xml.Linq;
//using Twilio.Annotations;
//using Twilio.TwiML.Voice;
//using Vonage.Applications.Capabilities;

namespace waamowaste
{
    public partial class sms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



            //[WebMethod]
            //public static string SendSMS(string message)
            //{
            //    try
            //    {
            //        HttpClient client = new HttpClient
            //        {
            //            BaseAddress = new Uri("https://smsapi.hormuud.com/token")
            //        };

            //        string username = "kismayoict";
            //        string password = "612040490";
            //        HttpResponseMessage response = client.PostAsync("Token",
            //            new StringContent(string.Format("grant_type=password&username={0}&password={1}",
            //            HttpUtility.UrlEncode(username),
            //            HttpUtility.UrlEncode(password)), Encoding.UTF8,
            //            "application/x-www-form-urlencoded")).Result;

            //        if (response == null)
            //        {
            //            throw new Exception("Response is null");
            //        }

            //        string resultJSON = response.Content.ReadAsStringAsync().Result;
            //        if (string.IsNullOrEmpty(resultJSON))
            //        {
            //            throw new Exception("Result JSON is null or empty");
            //        }

            //        string AccessToken = (JObject.Parse(resultJSON).SelectToken("access_token")).ToString();
            //        if (string.IsNullOrEmpty(AccessToken))
            //        {
            //            throw new Exception("Access token is null or empty");
            //        }

            //        client.DefaultRequestHeaders.Clear();
            //        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            //        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", AccessToken);

            //        var smsData = new
            //        {
            //            mobile = "618765010",
            //            message = message,
            //            senderid = "kismayoict"
            //        };

            //        var jsonContent = new StringContent(JsonConvert.SerializeObject(smsData), Encoding.UTF8, "application/json");
            //        HttpResponseMessage Res = client.PostAsync("api/Outbound/SendSMS", jsonContent).Result;
            //        return Res.IsSuccessStatusCode ? "Message sent successfully!" : "Error sending message.";
            //    }
            //    catch (Exception ex)
            //    {
            //        return $"Error: {ex.Message}";
            //    }
            //}
        }
    }



    