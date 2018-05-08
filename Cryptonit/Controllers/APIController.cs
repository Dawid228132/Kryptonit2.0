using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using BlockCypher;
using BlockCypher.Objects;

namespace Cryptonit.Controllers
{
    public class APIController : Controller
    {
        Blockcypher bc = new Blockcypher("1b4ed7ee7ddb4f918e93717945474e4e");

        // GET: API
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public async Task<ActionResult> Balance(string address)
        {
            var request = await bc.GetBalanceForAddress(address);

            Satoshi satoshi = request.Balance;

            decimal count = satoshi.Btc;

            ViewData["Address"] = count;

            return View();
        }
        
        public async Task<ActionResult> GenerateAddress()
        {
            var request = await bc.GenerateAddress();

            string address = request.Address;
            string publicKey = request.Public;
            string privateKey = request.Private;

            ViewData["Address"] = address;
            ViewData["Public"] = publicKey;
            ViewData["Private"] = privateKey;

            return View();
        }

        public async Task<ActionResult> Transactions(){
            var request = await bc.GetTransactions("1MSH1S19YGjcF8hM2j6cTxyLehjryGaMkq");

            for (int i = 0; i < request.Length; i++)
            {
                ViewData["Transaction" + i] = i + " Date of confirm: " + request[i].Confirmed + " Amount: " + request[i].Fees;
            }

            return View();
        }
        

        public async Task<ActionResult> Faucet()
        {
            Satoshi satoshi = new Satoshi(10000);
            await bc.Faucet("BuCuWnhdpi4CcM2oYFf7Cs1akdANiur7eY", satoshi);
            

            return View();
        }

        [HttpPost]
        public ActionResult Faucet2()
        {
            using (var client = new HttpClient())
            {
                //HTTP POST
                var postTask = bc.Faucet("C89d6EBnayPtaR6g6K2jReSnk2GAiVxMAV", 1000);
                postTask.Wait();

                var result = postTask.Result;
                
            
            }
          
            return View();
        }

        

    }
}