using System;

namespace MiCake.Identity.Authentication.JwtToken.Tests.FakeUser
{
    public class CommonUser : IMiCakeUser<long>
    {
        public long Id { get; set; }

        public string Name { get; set; }

        public CommonUser()
        {

        }
    }

    public class UserWithJwtClaim : IMiCakeUser<Guid>
    {
        [JwtClaim(ClaimName = "userid")]
        public Guid Id { get; set; }

        [JwtClaim()]
        public string Name { get; set; }

        public UserWithJwtClaim()
        {
        }
    }

    public class FakeCurrentUser_Guid : CurrentMiCakeUser<Guid>
    {
        public override Guid GetUserID()
        {
            return Guid.NewGuid();
        }
    }

    public class FakeCurrentUser_long : CurrentMiCakeUser<long>
    {
        public override long GetUserID()
        {
            return 1001;
        }
    }
}
