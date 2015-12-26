defmodule Scratchy.PostController do
  use Scratchy.Web, :controller
  alias Scratchy.Post

  plug :scrub_params, "post" when action in [:create, :update]

  def index(conn, _params) do
    page = from(p in Post, where: p.status == "published")
     |> Repo.paginate(_params)
    render conn, "index.json", 
      posts: page.entries,
      total_pages: page.total_pages, 
      page_number: page.page_number
  end

  def create(conn, %{"post" => post_params}) do
    changeset = Post.changeset(%Post{}, post_params)

    case Repo.insert(changeset) do
      {:ok, post} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", post_path(conn, :show, post))
        |> render("show.json", post: post)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Scratchy.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)
    render(conn, "show.json", post: post)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Repo.get!(Post, id)
    changeset = Post.changeset(post, post_params)

    case Repo.update(changeset) do
      {:ok, post} ->
        render(conn, "show.json", post: post)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Scratchy.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)

    Repo.delete!(post)

    send_resp(conn, :no_content, "")
  end
end
