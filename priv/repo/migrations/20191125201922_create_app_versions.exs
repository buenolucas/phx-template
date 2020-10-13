defmodule Arvore.Repo.Migrations.CreateAppVersions do
  use Ecto.Migration

  def change do
    create table(:app_versions) do
      add(:os, :string)
      add(:force_upgrade, :boolean, default: false)
      add(:version, :string)

      timestamps([{:inserted_at, :created_at}])
    end

    create(unique_index(:app_versions, [:os]))
  end
end
