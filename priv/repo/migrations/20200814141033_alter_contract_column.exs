defmodule Arvore.Repo.Migrations.AlterContractColumn do
  use Ecto.Migration

  def up do
    execute("ALTER TABLE contracts Change entity_id client_id int(11);")

    alter table(:contracts) do
      remove(:book_collection)
    end
  end

  def down do
    execute("ALTER TABLE contracts Change client_id entity_id int(11);")

    alter table(:contracts) do
      add(:book_collection, :string)
    end
  end
end
