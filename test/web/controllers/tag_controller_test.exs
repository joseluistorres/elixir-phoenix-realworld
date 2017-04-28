defmodule RealWorld.Web.TagControllerTest do
  use RealWorld.Web.ConnCase

  alias RealWorld.Blog

  @create_attrs %{name: "some name"}

  def fixture(:tag) do
    {:ok, tag} = Blog.create_tag(@create_attrs)
    tag
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, tag_path(conn, :index)
    assert json_response(conn, 200)["tags"] == []
  end

end
