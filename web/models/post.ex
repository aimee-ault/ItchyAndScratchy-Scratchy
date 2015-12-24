defmodule Scratchy.Post do
  use Scratchy.Web, :model

  schema "posts" do
    field :title, :string
    field :body, :string
    field :slug, :string
    field :image, :string
    field :status, :string
    field :featured, :boolean
    field :meta_title, :string
    field :meta_description, :string
    
    belongs_to :author, Scratchy.Author
    belongs_to :category, Scratchy.Category
    timestamps
  end

  @required_fields ~w(title body)
  @optional_fields ~w()

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
