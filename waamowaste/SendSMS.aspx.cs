using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
//using Twilio;
//using Twilio.Rest.Api.V2010.Account;
//using Vonage;
//using Vonage.Messaging;
//using Vonage.Request;

namespace waamowaste
{
    public partial class SendSMS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //    //// Define a class for recipient data
        //    //public class Recipient
        //    //{
        //    //    public string Name { get; set; }
        //    //    public string PhoneNumber { get; set; }
        //    //}
        //    //[WebMethod]
        //    //public static async Task<string> SendPersonalizedMessagesAsync(List<Recipient> recipients, string baseMessage)
        //    //{
        //    //    string apiKey = "e94139dd";       // Replace with your Vonage API Key
        //    //    string apiSecret = "PUYOpi7LHAQ2UCFM"; // Replace with your Vonage API Secret
        //    //    string fromPhoneNumber = "+252614112537";  // Replace with your Vonage sender ID or phone number

        //    //    var credentials = Credentials.FromApiKeyAndSecret(apiKey, apiSecret);
        //    //    var client = new VonageClient(credentials);

        //    //    foreach (var recipient in recipients)
        //    //    {
        //    //        try
        //    //        {
        //    //            string personalizedMessage = $"{baseMessage}, {recipient.Name}!";

        //    //            var request = new SendSmsRequest
        //    //            {
        //    //                To = fromPhoneNumber,
        //    //                From = fromPhoneNumber,
        //    //                Text = personalizedMessage
        //    //            };

        //    //            // Use the async method
        //    //            var response = await client.SmsClient.SendAnSmsAsync(request);

        //    //            // Check response status
        //    //            if (response.Messages[0].Status != "0")
        //    //            {
        //    //                return $"Failed to send to {recipient.PhoneNumber}: {response.Messages[0].ErrorText}";
        //    //            }
        //    //        }
        //    //        catch (Exception ex)
        //    //        {
        //    //            return $"Error sending to {recipient.PhoneNumber}: {ex.Message}";
        //    //        }
        //    //    }

        //    //    return "Messages sent successfully!";
        //    //}


        //    // Define a class for recipient data
        //    public class Recipient
        //    {
        //        public string Name { get; set; }
        //        public string PhoneNumber { get; set; }
        //    }

        //    [WebMethod]
        //    public static string SendPersonalizedMessages(List<Recipient> recipients, string baseMessage)
        //    {
        //        string accountSid = "ACb4ed95c4ad38c93c4d1634363c774b14"; // Replace with your Twilio Account SID
        //        string authToken = "a6cd29e38341523593c75a833158a80f";   // Replace with your Twilio Auth Token
        //        string fromPhoneNumber = "+17753106981";        // Replace with your Twilio phone number

        //        TwilioClient.Init(accountSid, authToken);

        //        foreach (var recipient in recipients)
        //        {
        //            try
        //            {
        //                string personalizedMessage = $"{baseMessage}, {recipient.Name}!"; // Custom message for each user

        //                var sms = MessageResource.Create(
        //                    body: personalizedMessage,
        //                    from: new Twilio.Types.PhoneNumber(fromPhoneNumber),
        //                    to: new Twilio.Types.PhoneNumber(recipient.PhoneNumber)
        //                );
        //            }
        //            catch (Exception ex)
        //            {
        //                return $"Failed to send to {recipient.PhoneNumber}: {ex.Message}";
        //            }
        //        }

        //        return "Messages sent successfully!";
        //    }
        //}
    }
}