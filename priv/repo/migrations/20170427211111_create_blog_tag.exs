defmodule RealWorld.Repo.Migrations.CreateRealWorld.Blog.Tag do
  use Ecto.Migration

  def change do
    create table(:blog_tags) do
      add :name, :string

      timestamps()
    end

  end
end
