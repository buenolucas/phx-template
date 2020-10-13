defmodule Arvore.Repo.Migrations.CreateSharedReading do
  use Ecto.Migration

  def change do
    create table(:shared_readings) do
      add(:reader_id, :integer, null: false)
      add(:book_id, :integer, null: false)
      add(:school_id, :integer, null: false)
      add(:degree, :string, null: false)

      timestamps([{:inserted_at, :created_at}])
    end

    create(unique_index(:shared_readings, [:reader_id, :book_id, :school_id, :degree]))
    create(index(:shared_readings, :reader_id))
    create(index(:shared_readings, :book_id))
    create(index(:shared_readings, :school_id))
    create(index(:shared_readings, :degree))
  end
end
