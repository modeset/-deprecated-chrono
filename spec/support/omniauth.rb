OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:github] = {
 credentials: {
  expires: false,
  token: "a41268fcc16b17cbc5d"
 },
 extra: {
   raw_info: {
     avatar_url: "https://secure.gravatar.com/avatar/773a137d6fc051556c6a8df81fbfa315?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
     bio: nil,
     blog: "http://www.example.com/",
     collaborators: 0,
     company: "Acme Labs",
     created_at: "2008-09-01T19:31:01Z",
     disk_usage: 10200,
     email: nil,
     events_url: "https://api.github.com/users/example/events{/privacy}",
     followers: 26,
     followers_url: "https://api.github.com/users/example/followers",
     following: 10,
     following_url: "https://api.github.com/users/example/following",
     gists_url: "https://api.github.com/users/example/gists{/gist_id}",
     gravatar_id: "773a137d6fc051556c6a8df81fbfa315",
     hireable: false,
     html_url: "https://github.com/example",
     id: 22783,
     location: "Springfield",
     login: "example",
     name: "Example User",
     organizations_url: "https://api.github.com/users/example/orgs",
     owned_private_repos:0,
     plan: {
       collaborators: 0,
       name: "free",
       private_repos: 0,
       space: 307200
     },
     private_gists: 7,
     public_gists: 13,
     public_repos: 28,
     received_events_url: "https://api.github.com/users/example/received_events",
     repos_url: "https://api.github.com/users/example/repos",
     starred_url: "https://api.github.com/users/example/starred{/owner}{/repo}",
     subscriptions_url: "https://api.github.com/users/example/subscriptions",
     total_private_repos: 1,
     type: "User",
     url: "https://api.github.com/users/example"
   }
 },
 info: {
   email: nil,
   name: "Example User",
   nickname: "example",
   urls: {
     "Blog" => "http://www.example.com/",
     "GitHub" => "https://github.com/example"
   }
 },
 provider: "github",
 uid: 22123
}
