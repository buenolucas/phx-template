defmodule Arvore.Repo.Migrations.AddDataCollectionOutsetToEntities do
  use Ecto.Migration

  def change do
    alter table("entities") do
      add(:data_collection_outset, :boolean, default: false)
      add(:reference_external_id, :string)
    end
  end
end
