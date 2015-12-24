defmodule Scratchy.Repo.Migrations.AddFieldsToPosts do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :slug, :string
      add :image, :string
      add :featured, :boolean
      add :status, :string
      add :meta_title, :string
      add :meta_description, :string
      add :author_id, :integer
    end
  end
end
