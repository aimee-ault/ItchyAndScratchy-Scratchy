defmodule Scratchy.Repo do
  use Ecto.Repo, otp_app: :scratchy
  use Scrivener, page_size: 10
end
