defmodule Arvore.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add(:reader_id, :integer)
      add(:coins, :decimal, default: 0, precision: 9, scale: 2, null: false)
      add(:water_drops, :decimal, default: 0, precision: 9, scale: 2, null: false)

      timestamps([{:inserted_at, :created_at}])
    end

    create unique_index(:games, [:reader_id])
  end
end
