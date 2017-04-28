defmodule RealWorld.Web.TagController do
  use RealWorld.Web, :controller

  alias RealWorld.Blog
  alias RealWorld.Blog.Tag

  action_fallback RealWorld.Web.FallbackController

  def index(conn, _params) do
    tags = Blog.list_tags()
    render(conn, "index.json", tags: tags)
  end

  def create(conn, %{"tag" => tag_params}) do
    with {:ok, %Tag{} = tag} <- Blog.create_tag(tag_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", tag_path(conn, :show, tag))
      |> render("show.json", tag: tag)
    end
  end

  def show(conn, %{"id" => id}) do
    tag = Blog.get_tag!(id)
    render(conn, "show.json", tag: tag)
  end

  def update(conn, %{"id" => id, "tag" => tag_params}) do
    tag = Blog.get_tag!(id)

    with {:ok, %Tag{} = tag} <- Blog.update_tag(tag, tag_params) do
      render(conn, "show.json", tag: tag)
    end
  end

  def delete(conn, %{"id" => id}) do
    tag = Blog.get_tag!(id)
    with {:ok, %Tag{}} <- Blog.delete_tag(tag) do
      send_resp(conn, :no_content, "")
    end
  end
end
