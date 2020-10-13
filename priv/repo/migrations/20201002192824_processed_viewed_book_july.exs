defmodule Arvore.Repo.Migrations.ProcessedViewedBookJuly do
  use Ecto.Migration

  def change do
    # This table was only available by MySQL commands. With this migration,
    # we ensure that the table is only created if it is not present.
    create_if_not_exists table(:processed_viewed_book_july) do
      add :book_id, :integer, default: nil
      add :effective_percentage, :decimal, precision: 5, scale: 2, default: nil
      add :profile_id, :integer, default: nil
      add :total_time_spent, :integer, default: nil
      add :root_id, :integer, default: nil
      add :reader_id, :integer, default: nil
      add :entity_id, :integer, default: nil
      add :degree, :string, default: nil

      timestamps([{:inserted_at, :created_at}])
    end
  end
end
