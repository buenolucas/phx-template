defmodule Arvore.Repo.Migrations.AddStatusToBookShelfItems do
  use Ecto.Migration

  def change do
    alter table("book_shelf_items") do
      add(:status, :boolean, default: true, null: false)
    end
  end
end
