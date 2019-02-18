defmodule PackingListWeb.ListsController do
  use PackingListWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"list_id" => list_id}) do
    render(conn, "show.html", list_id: list_id)
  end
end
