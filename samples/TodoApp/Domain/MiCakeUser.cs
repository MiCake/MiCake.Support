using MiCake.DDD.Domain;
using MiCake.Identity;
using MiCake.Identity.Authentication;
using MiCake.Identity.Authentication.JwtToken;

namespace TodoApp.Domain
{
    public abstract class MiCakeUser<TKey> : AggregateRoot<TKey>, IMiCakeUser<TKey> where TKey : notnull
    {
        [JwtClaim(ClaimName = MiCakeClaimTypes.UserId)]
        protected TKey IdForClaim => this.Id;
    }
}
