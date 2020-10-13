defmodule Arvore.Repo.Migrations.CreateVouchers do
  use Ecto.Migration

  def change do
    create table(:vouchers) do
      add(:code, :string, null: false)
      add(:root_id, :integer)
      add(:user_id, :integer)
      add(:redeemed, :boolean, default: false, null: false)
      add(:redeemed_date, :naive_datetime, default: nil)

      timestamps([{:inserted_at, :created_at}])
    end

    create(unique_index(:vouchers, :code))
    create(index(:vouchers, [:user_id, :root_id]))
  end
end
