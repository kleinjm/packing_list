defmodule PackingListWeb.PageController do
  use PackingListWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
