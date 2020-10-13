defmodule Arvore.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add(:slug, :string)
      add(:name, :string)
      add(:subtitle, :string)
      add(:kind, :string)
      add(:briefing, :string)
      add(:description, :string)
      add(:price, :decimal, default: 0, precision: 9, scale: 2, null: false)
      add(:task, :string)
      add(:task_value, :string)
      add(:prerequisite, :string)
      add(:prerequisite_value, :string)
      add(:prerequisite_data, :string)
      timestamps([{:inserted_at, :created_at}])
    end
  end

end
