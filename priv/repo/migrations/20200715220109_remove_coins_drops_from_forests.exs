defmodule Arvore.Repo.Migrations.RemoveCoinsDropsFromForests do
  use Ecto.Migration

  def change do
    alter table("forests") do
      remove :coins
      remove :water_drops
    end
  end
end
