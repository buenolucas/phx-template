defmodule Arvore.Repo.Migrations.CreateRankingUsersSuspended do
  use Ecto.Migration

  def change do
    create table(:ranking_users_suspended) do
      add(:reader_id, :integer)
      add(:degree, :string)
      add(:year, :integer)
      add(:month, :integer)
      add(:points, :integer)
      add(:rank_position, :integer)
      add(:tier, :string)

      add(:ranking_analysis_id, references(:ranking_analysis, on_delete: :nothing))

      timestamps()
    end

      create(unique_index(:ranking_users_suspended, [:reader_id, :year, :month]))
  end
end
