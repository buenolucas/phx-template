defmodule Arvore.Repo.Migrations.ChangeBookPriceHistoryDateColumn do
  use Ecto.Migration

  def up do
    drop unique_index(:book_price_history, [:book_id, :date])

    alter table(:book_price_history) do
      remove(:date)
      add(:datetime, :utc_datetime, null: false)
    end

    create unique_index(:book_price_history, [:book_id, :datetime])
  end

  def down do
    drop unique_index(:book_price_history, [:book_id, :datetime])

    alter table(:book_price_history) do
      remove(:datetime)
      add(:date, :date, null: false)
    end

    create unique_index(:book_price_history, [:book_id, :date])
  end
end
