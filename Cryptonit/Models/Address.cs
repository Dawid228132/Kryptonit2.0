//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Cryptonit.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Address
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string AddressHash { get; set; }
        public int CurrencyId { get; set; }
        public int PublicKeyId { get; set; }
        public int SignatureId { get; set; }
    
        public virtual Currency Currency { get; set; }
        public virtual Currency Currency1 { get; set; }
        public virtual PublicKey PublicKey { get; set; }
        public virtual PublicKey PublicKey1 { get; set; }
        public virtual Signature Signature { get; set; }
        public virtual Users Users { get; set; }
    }
}
