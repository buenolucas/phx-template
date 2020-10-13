defmodule Arvore.Repo.Migrations.CreateContractModuleEntities do
  use Ecto.Migration

  def change do
    create table(:contract_module_entities) do
      add(:module_id, :integer, null: false)
      add(:contract_module_id, :integer, null: false)
      add(:entity_id, :integer, null: false)

      timestamps([{:inserted_at, :created_at}])
    end

    create(index(:contract_module_entities, :entity_id))
    create(index(:contract_module_entities, :module_id))
    create(index(:contract_module_entities, :contract_module_id))
    create(unique_index(:contract_module_entities, [:module_id, :entity_id]))
  end
end
