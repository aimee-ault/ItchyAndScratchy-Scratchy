defmodule Scratchy.PostView do
  use Scratchy.Web, :view

  def render("index.json", %{posts: posts, total_pages: total_pages, page_number: page_number}) do
    %{
      posts: render_many(posts, Scratchy.PostView, "post.json"), 
      meta: %{
        total: total_pages,
        page_number: page_number
      }
    }
  end

  def render("show.json", %{post: post}) do
    %{post: render_one(post, Scratchy.PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{id: post.id,
      title: post.title,
      body: post.body,
      category_id: post.category_id,
      slug: post.slug,
      featured: post.featured,
      status: post.status,
      meta_title: post.meta_title,
      meta_description: post.meta_description,
      author_id: post.author_id,
      created_at: post.inserted_at}
  end
end
