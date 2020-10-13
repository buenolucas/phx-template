defmodule Arvore.Repo.Migrations.CreateSharedReadingLike do
  use Ecto.Migration

  def change do
    create table(:shared_reading_likes) do
      add(:reader_id, :integer, null: false)
      add(:book_id, :integer, null: false)
      add(:school_id, :integer, null: false)
      add(:degree, :string, null: false)

      timestamps([{:inserted_at, :created_at}])
    end

    create(unique_index(:shared_reading_likes, [:reader_id, :book_id, :school_id, :degree]))
    create(index(:shared_reading_likes, :reader_id))
    create(index(:shared_reading_likes, :book_id))
    create(index(:shared_reading_likes, :school_id))
    create(index(:shared_reading_likes, :degree))
  end
end
