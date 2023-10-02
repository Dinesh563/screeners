defmodule ScreenersLiveWeb.StocksController do
  use ScreenersLiveWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.

    stocks = [
      %{name: "SBIN", price: 600},
      %{name: "TATA", price: 130},
      %{name: "TVS", price: 1490}
    ]

    conn
    |> assign(:stocks, stocks)
    |> render(:home, layout: false)
  end
end
