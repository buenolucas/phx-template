defmodule Arvore.Repo.Migrations.CreateContractModules do
  use Ecto.Migration

  def change do
    create table(:contract_modules) do
      add(:name, :string)
      add(:contract_id, :integer)
      add(:info, :map)

      timestamps([{:inserted_at, :created_at}])
    end
  end
end
