defmodule Arvore.Repo.Migrations.AddColumnsCollectionsToBookShelves do
  use Ecto.Migration

  def change do
    alter table("book_shelves") do
      add(:type, :string)
      add(:description, :string)
      add(:image, :string)
    end

  end
end
