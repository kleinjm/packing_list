defmodule PackingListWeb.PackController do
  use PackingListWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
