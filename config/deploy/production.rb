server "51.15.93.216", user: "deployer", roles: %w{app db web}, primary: true
set :rails_env, :production

set :ssh_options, {
  keys: %w(/home/denio/.ssh/denio),
  forward_agent: true,
  auth_methods: %w(publickey password),
  port: 2222
}
