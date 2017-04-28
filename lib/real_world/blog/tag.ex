defmodule RealWorld.Blog.Tag do
  use Ecto.Schema

  schema "blog_tags" do
    field :name, :string

    timestamps()
  end
end
