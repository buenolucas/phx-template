defmodule Arvore.Repo.Migrations.CreateModules do
  use Ecto.Migration

  def up do
    create table(:modules) do
      add(:name, :string, null: false)

      timestamps([{:inserted_at, :created_at}])
    end

    create(unique_index(:modules, [:name]))
  end

  def down do
    drop(table(:modules))
  end
end
