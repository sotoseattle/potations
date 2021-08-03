defmodule PepeWeb.WrongLive do
  use PepeWeb, :live_view

  def mount(_params, session, conn) do
    {:ok,
     assign(conn,
       target: Enum.random(1..10) |> Integer.to_string(),
       message: "Guess a number",
       score: 0,
       user: Pepe.Accounts.get_user_by_session_token(session["user_token"]),
       session_id: session["live_socket_id"]
     )}
  end

  def render(assigns) do
    ~L"""
    <h1>GUESS!</h1>
    <h2>
      <%= for n <- 1..10 do %>
        <a href="#" phx-click="guess" phx-value-number="<%= n %>">
          <%= n %>
        </a>
      <% end %>
    </h2>
    <h2>
      Score: <%= @score %>
      <br/>
      <%= @message %>
    </h2>
    <pre>
    <%= @user.email %>
    <%= @session_id %>
    </preh3>
    """
  end

  def handle_event("guess", %{"number" => n}, conn) do
    {:noreply, verify(conn.assigns.target, n, conn)}
  end

  defp verify(n, n, conn) do
    assign(conn, message: "BINGO!", score: conn.assigns.score + 10)
  end

  defp verify(_target, _n, conn) do
    assign(conn, message: "WRONG!", score: conn.assigns.score - 1)
  end
end
