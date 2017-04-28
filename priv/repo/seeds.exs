# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RealWorld.Repo.insert!(%RealWorld.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias RealWorld.Repo
alias RealWorld.Blog

Blog.create_tag(%{name: "reactjs"})
Blog.create_tag(%{name: "angularjs"})