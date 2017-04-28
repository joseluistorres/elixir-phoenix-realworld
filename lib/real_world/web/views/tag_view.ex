defmodule RealWorld.Web.TagView do
  use RealWorld.Web, :view
  alias RealWorld.Web.TagView

  def render("index.json", %{tags: tags}) do
    %{tags: render_many(tags, TagView, "tag.json")}
  end

  def render("show.json", %{tag: tag}) do
    %{tags: render_one(tag, TagView, "tag.json")}
  end

  def render("tag.json", %{tag: tag}) do
    tag.name
  end
end
