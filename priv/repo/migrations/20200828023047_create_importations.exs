defmodule Arvore.Repo.Migrations.CreateImportations do
  use Ecto.Migration

  def change do
    create table(:importations) do
      add(:user_id, :integer, null: false)
      add(:entity_id, :integer, null: false)
      add(:status, :string, null: false)
      add(:process_type, :string, null: false)
      add(:sheet_url, :string, null: false)
      add(:progress, :integer)

      timestamps([{:inserted_at, :created_at}])
    end
  end
end
