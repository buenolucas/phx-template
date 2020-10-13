defmodule Arvore.Repo.Migrations.CreateRankingAnalysis do
  use Ecto.Migration

  def change do
    create table(:ranking_analysis) do
      add(:year, :integer)
      add(:month, :integer)
      add(:status, :boolean, default: false, null: false)
      add(:deadline_date, :date)

      timestamps()
    end

      create(unique_index(:ranking_analysis, [:year, :month]))
  end
end
