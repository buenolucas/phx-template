defmodule Arvore.Repo.Migrations.AddFieldAgeToTrees do
  use Ecto.Migration

  def change do
    alter table("trees") do
      add(:max_age, :integer)
    end
  end
end
