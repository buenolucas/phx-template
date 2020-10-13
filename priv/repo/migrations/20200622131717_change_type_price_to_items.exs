defmodule Arvore.Repo.Migrations.ChangeTypePriceToItems do
  use Ecto.Migration

  def change do
    alter table("items") do
      modify :price, :integer
    end
  end
end
