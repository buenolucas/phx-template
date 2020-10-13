defmodule Arvore.Repo.Migrations.AddDeletedAtToBookShelfItems do
  use Ecto.Migration

  def change do
    alter table("book_shelf_items") do
      add(:deleted_at, :date)
    end
  end
end
