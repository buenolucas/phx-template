defmodule Arvore.Repo.Migrations.CreateBookSuggestions do
  use Ecto.Migration

  def change do
    create table(:book_suggestions) do
      add(:ranking, :integer)
      add(:reader_id, :integer)
      add(:book_id, :integer)
      add(:status, :integer)

      timestamps([{:inserted_at, :created_at}])
    end

    create unique_index(:book_suggestions, [:reader_id, :book_id])
    create index(:book_suggestions, :reader_id)
    create index(:book_suggestions, :book_id)
  end
end
