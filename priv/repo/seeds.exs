# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
Scratchy.Repo.insert!(%Scratchy.Category{name: "Personal"})
Scratchy.Repo.insert!(%Scratchy.Category{name: "Travel"})
Scratchy.Repo.insert!(%Scratchy.Category{name: "Programming"})

Scratchy.Repo.insert!(%Scratchy.Post{title: "Love 2 Fuck", slug: "love-2-fuck"})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
