defmodule Arvore.Repo.Migrations.AddFirstChargeDateToContract do
  use Ecto.Migration

  def change do
    alter table("contracts") do
      add(:first_charge_date, :date)
    end
  end
end
