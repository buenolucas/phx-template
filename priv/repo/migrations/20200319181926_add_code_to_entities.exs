defmodule Arvore.Repo.Migrations.AddCodeToEntities do
  use Ecto.Migration

  def change do
    alter table("entities") do
      add(:code, :string)
    end

    create(unique_index(:entities, [:code]))
  end
end
