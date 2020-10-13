defmodule Arvore.Repo.Migrations.CreateImportationReaders do
  use Ecto.Migration

  def change do
    create table(:importation_readers) do
      add(:importation_id, :integer, null: false)
      add(:reader_type, :string, null: false)
      add(:status, :string, null: false)
      add(:processed, :boolean, default: false, null: false)
      add(:info, :map, null: false)

      timestamps([{:inserted_at, :created_at}])
    end
  end
end
