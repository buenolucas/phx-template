defmodule Arvore.Repo.Migrations.AddArchivedToForests do
  use Ecto.Migration

  def change do
    alter table("forests") do
      add(:archived, :boolean, default: false)
      add(:archived_at, :naive_datetime, default: nil)
    end
  end
end
