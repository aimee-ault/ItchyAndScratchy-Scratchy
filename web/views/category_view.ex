defmodule Scratchy.CategoryView do
  use Scratchy.Web, :view

  def render("index.json", %{categories: categories}) do
    %{categories: render_many(categories, Scratchy.CategoryView, "category.json")}
  end

  def render("show.json", %{category: category}) do
    %{category: render_one(category, Scratchy.CategoryView, "category.json")}
  end

  def render("category.json", %{category: category}) do
    %{id: category.id,
      name: category.name}
  end
end
