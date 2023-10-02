defmodule ScreenersLive.Repo do
  use Ecto.Repo,
    otp_app: :screeners_live,
    adapter: Ecto.Adapters.Postgres
end
