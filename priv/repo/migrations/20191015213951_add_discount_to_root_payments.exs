defmodule Arvore.Repo.Migrations.AddDiscountToRootPayments do
  use Ecto.Migration

  def change do
    alter table("root_payments") do
      add(:discount, :decimal, default: 0, precision: 3, scale: 2, null: false)
      add(:discount_due_date, :date)
    end
  end
end
