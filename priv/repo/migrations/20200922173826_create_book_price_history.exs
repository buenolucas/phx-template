defmodule Arvore.Repo.Migrations.CreateBookPriceHistory do
  use Ecto.Migration

  def change do
    create table(:book_price_history) do
      add(:book_id, references(:books, type: :id, on_delete: :nothing), null: false)
      add(:price, :decimal, precision: 9, scale: 2, null: false)
      add(:date, :date, null: false)

      timestamps([{:inserted_at, :created_at}])
    end

    create index(:book_price_history, :book_id)
    create unique_index(:book_price_history, [:book_id, :date])
  end
end
