//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Cryptonit.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class UserContact
    {
        public int Id { get; set; }
        public string ContactAddress { get; set; }
        public int CurrencyId { get; set; }
        public string ContactName { get; set; }
        public int UserId { get; set; }
    
        public virtual Currency Currency { get; set; }
        public virtual Users Users { get; set; }
    }
}
