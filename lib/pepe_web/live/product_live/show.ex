defmodule PepeWeb.ProductLive.Show do
  use PepeWeb, :live_view

  alias Pepe.Catalog

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:product, Catalog.get_product!(id))
     # assignment 4.1: add a message
     |> assign(:message, "10% Discount, only this week!")}
  end

  defp page_title(:show), do: "Show Product"
  defp page_title(:edit), do: "Edit Product"
end
