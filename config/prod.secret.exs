use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :scratchy, Scratchy.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE")
  
# Configure your database
config :scratchy, Scratchy.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: { :system, "DATABASE_URL" },
  pool_size: 20
