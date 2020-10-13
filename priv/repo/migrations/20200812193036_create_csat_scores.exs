defmodule Arvore.Repo.Migrations.CreateCsatScores do
  use Ecto.Migration

  def change do
    create table(:csat_scores) do
      add(:reader_id, :integer, null: false)
      add(:score, :integer, null: false)
      add(:reason, :string)
      add(:source, :string)
      add(:context, :string, null: false)

      timestamps([{:inserted_at, :created_at}, {:updated_at, false}])
    end

    create(index(:csat_scores, [:reader_id]))
    create(index(:csat_scores, [:context]))
    create(unique_index(:csat_scores, [:reader_id, :context]))
  end
end
