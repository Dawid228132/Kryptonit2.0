using Cryptonit.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using BlockCypher;
using System.Threading.Tasks;

namespace Cryptonit.Controllers
{
    public class UserController : Controller
    {

        Blockcypher bc = new Blockcypher("1b4ed7ee7ddb4f918e93717945474e4e");

        public ActionResult Index()
        {
            using (Entities db = new Entities())
            {
                return View(db.Users.ToList());
            }
                
        }
        public ActionResult Register()
        {
            return View();
        }
        public ActionResult noPremission()
        {
            return View();
        }
        [HttpPost]
        public async Task<ActionResult> Register( Users user)
        {
           if(ModelState.IsValid)
            {
                using (Entities db = new Entities())
                {
                    bool isEmail = IsEmailExist(user.email);
                    bool isLogin = IsLoginExist(user.login);
                   
                    if(isLogin)
                    {
                        ModelState.AddModelError("LoginExist", "Login already exist.");
                        return View(user);
                    }
                    if (isEmail)
                    {
                        ModelState.AddModelError("EmailExist", "Email already exist.");
                        return View(user);
                    }
                    if (!isLogin&&!isEmail)
                    {
                        user.salt = HashPassword.createSalt();
                       
                        user.password = HashPassword.hash(user.password,user.salt);
                        user.confirmPassword= HashPassword.hash(user.confirmPassword,user.salt);
                        db.Users.Add(user);
                        // db.SaveChanges();
                        ViewBag.Message = "success";

                        List<string> addressInfo = await GenerateAddress();

                        PublicKey publicKey = new PublicKey();
                        publicKey.HashCode = addressInfo[1];
                        db.PublicKey.Add(publicKey);

                        Signature signature = new Signature();
                        signature.HashCode = addressInfo[2];
                        db.Signature.Add(signature);
                        db.SaveChanges();

                        int lastUsersId = 0;
                        foreach (Users u in db.Users.ToArray())
                        {
                            lastUsersId += 1;
                        }

                        Address address = new Address();
                        address.UserId = lastUsersId;
                        address.AddressHash = addressInfo[0];
                        address.CurrencyId = 1;
                        address.PublicKeyId = lastUsersId;
                        address.SignatureId = lastUsersId;

                        db.Address.Add(address);
                        db.SaveChanges();
                    }
                }
                ModelState.Clear();
                
            }
            return View();

        }
        private async Task<List<string>> GenerateAddress()
        {
            List<string> listOfKeys = new List<string>();
            
            var request = await bc.GenerateAddress();

            string address = request.Address;
            string publicKey = request.Public;
            string privateKey = request.Private;

            //ViewData["Address"] = address;
            //ViewData["Public"] = publicKey;
            //ViewData["Private"] = privateKey;

            listOfKeys.Add(address);
            listOfKeys.Add(publicKey);
            listOfKeys.Add(privateKey);

            return listOfKeys;
        }
        [NonAction]
        public bool IsEmailExist(string email)
        {
            using (Entities db = new Entities())
            {
                foreach (Users u in db.Users.ToArray())
                {
                    if (u.email.Equals(email))
                        return true;
                }

                return false;    
            }
        }
        public bool IsLoginExist(string login)
        {
            using (Entities db = new Entities())
            {
                foreach (Users u in db.Users.ToArray())
                {
                    if (u.login.Equals(login))
                        return true;
                }
                return false;
            }
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(Users user)
        {

                using (Entities db = new Entities())
                {
                    //user.password = HashPassword.hash(user.password);
                    foreach (Users u in db.Users.ToArray())
                    {
                        if (u.login==user.login&& HashPassword.hash(user.password,u.salt)==u.password)
                        {
                            Session["UserID"] = u.Id;
                            
                            Session["UserLogin"] = u.login;
                            return Redirect("~/Wallet/Index");
                        }
                    }  
            }
            

            ModelState.AddModelError("LoginError", "Login or Password is wrong.");
            return View();
        }

        public ActionResult LoggedIn()
        {
            if(Session["UserID"]!=null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login");
            }
        }
    }
    

 
}