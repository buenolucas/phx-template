defmodule Arvore.Repo.Migrations.AddIndexToItems do
  use Ecto.Migration

  def change do
    create unique_index("items", [:slug])
  end
end
