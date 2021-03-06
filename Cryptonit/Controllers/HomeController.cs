﻿using BlockCypher;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

//HEJ TU JEST ZMIANA

namespace Cryptonit.Controllers
{
    public class HomeController : Controller
    {
        Blockcypher bc = new Blockcypher();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Description page";

            return View();
        }

        
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult LogOut()
        {
            Session.Clear();
            return RedirectToAction("Index");
        }

    }
}