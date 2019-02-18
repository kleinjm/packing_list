defmodule PackingListWeb.ListsControllerTest do
  use PackingListWeb.ConnCase

  test "GET /lists", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200)
  end
end
