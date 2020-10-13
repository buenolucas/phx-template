defmodule Arvore.Repo.Migrations.CreateTrees do
  use Ecto.Migration

  def change do
    create table(:trees) do
      add(:forest_id, :integer)
      add(:position, :integer)
      add(:slug, :string)
      add(:age, :integer)
      add(:growth_time, :integer)
      add(:special_item_used, :boolean, default: false)

      timestamps([{:inserted_at, :created_at}])
    end

    create unique_index(:trees, [:forest_id, :position])
  end
end
