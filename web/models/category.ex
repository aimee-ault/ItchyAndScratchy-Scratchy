defmodule Scratchy.Category do
  use Scratchy.Web, :model

  schema "categories" do
    field :name, :string
    has_many :posts, Scratchy.Post
    timestamps
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  def with_posts(query) do
    from q in query, preload: [posts: :posts]
  end

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
