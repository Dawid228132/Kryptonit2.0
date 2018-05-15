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
        public ActionResult MyAddresses()
        {
            if (!Premission())
                return Redirect("~/User/NoPremission");
            return View();
        }

        public ActionResult Send()
        {
            if (!Premission())
                return Redirect("~/User/NoPremission");
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