defmodule Arvore.Repo.Migrations.RemoveUniqueIndexToForests do
  use Ecto.Migration

  def change do
    drop unique_index(:forests, [:reader_id])
  end
end
