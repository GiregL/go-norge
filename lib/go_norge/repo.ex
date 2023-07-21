defmodule GoNorge.Repo do
  use Ecto.Repo,
    otp_app: :go_norge,
    adapter: Ecto.Adapters.SQLite3
end
