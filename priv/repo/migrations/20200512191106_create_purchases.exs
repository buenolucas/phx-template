defmodule Arvore.Repo.Migrations.CreatePurchases do
  use Ecto.Migration

  def change do
    create table(:purchases) do
      add(:item_id, :integer)
      add(:forest_id, :integer)
      add(:tree_id, :integer)

      timestamps([{:inserted_at, :created_at}])
    end

  end
end
