defmodule Arvore.Repo.Migrations.AddBgColorToBookShelves do
  use Ecto.Migration

  def change do
    alter table("book_shelves") do
      add(:bg_color, :string)
    end

  end
end
