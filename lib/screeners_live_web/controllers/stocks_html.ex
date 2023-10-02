defmodule ScreenersLiveWeb.StocksHTML do
  use ScreenersLiveWeb, :html

  # embed_templates "stocks_html/*"

  def home(assigns) do
    ~H"""
    <h1>Hello World</h1>
    <.h1 />
    <div class="stock-container">
      <%= for stock <- @stocks do %>
        <.card name={stock.name} price={stock.price} />
      <% end %>
    </div>
    """
  end

  attr :message, :string, default: "Dinesh "

  def h1(assigns) do
    ~H"""
    <p>Hello, <%= @message %>!</p>
    """
  end

  def card(assigns) do
    ~H"""
    <div class="card">
      <label> Stock name: </label> <%= @name %> <br />
      <label> Stock Price: </label> <%= @price %>
    </div>
    """
  end
end
