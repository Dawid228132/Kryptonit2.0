using BlockCypher;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Cryptonit.Models;
namespace Cryptonit.Controllers
{
    public class WalletController : Controller
    {
        Blockcypher bc = new Blockcypher();
        // GET: Wallet
        public ActionResult Index()
        {
            if(!Premission())
                return Redirect("~/User/NoPremission");
            return View();
        }
        public ActionResult AddNewAddress()
        {
            if (!Premission())
                return Redirect("~/User/NoPremission");

            return View();
            
        }
        [HttpPost]
        public ActionResult AddNewAddress(String ContactName, String ContactAddress, String Currency)
        {
            using (Entities db = new Entities())
            {
                
                UserContact contact = new UserContact();
                foreach(Currency c in db.Currency.ToArray())
                {
                    if (c.Name == Currency)
                    {
                        contact.CurrencyId = c.Id;
                        break;
                    }
                       
                }
              
                contact.ContactAddress = ContactAddress;
                contact.ContactName = ContactName;
                contact.UserId = (int) Session["UserID"];
                db.UserContact.Add(contact);
                db.SaveChanges();

                ViewBag.Message = "success";

            }
           
            return View();

        }
        [HttpPost]
        public ActionResult Delete()
        {
            
            var id = Url.RequestContext.RouteData.Values["id"];
            if(id!=null)
            using (Entities db = new Entities())
            {
                    int i = int.Parse((string) id);
                    UserContact uc = db.UserContact.Find(i);
                    if(uc!=null)
                        { 
                        db.UserContact.Remove(uc);
                        db.SaveChanges();
                        }
                    }
            return Redirect("~/Wallet/MyAddresses");

        }
        public ActionResult MyAddresses()
        {
            Session["UserId"] = 11;
            if (!Premission())
                return Redirect("~/User/NoPremission");

            return View();
        }

        public ActionResult Send()
        {
            if (!Premission())
                return Redirect("~/User/NoPremission");
            var address = Url.RequestContext.RouteData.Values["id"];
            if (address != null)
            {
                Session["SendAddress"] = address;
            }
            return View();
        }

        public ActionResult History()
        {
            if (!Premission())
                return Redirect("~/User/NoPremission");
            return View();
        }
        [NonAction]
        public Boolean Premission()
        {
            if (Session["UserId"] != null)
                return true;
            return true;
        }
    }
}