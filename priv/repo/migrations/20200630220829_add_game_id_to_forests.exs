defmodule Arvore.Repo.Migrations.AddGameIdToForests do
  use Ecto.Migration

  def change do
    alter table("forests") do
      add(:game_id, :integer)
    end
  end
end
