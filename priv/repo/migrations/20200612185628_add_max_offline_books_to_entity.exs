defmodule Arvore.Repo.Migrations.AddMaxOfflineBooksToEntity do
  use Ecto.Migration

  def change do
    alter table("entities") do
      add(:max_offline_books, :integer)
    end
  end
end
