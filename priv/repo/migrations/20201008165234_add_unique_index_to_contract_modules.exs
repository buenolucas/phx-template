defmodule Arvore.Repo.Migrations.AddUniqueIndexToContractModules do
  use Ecto.Migration

  def change do
    create index("contract_modules", :contract_id)
    create index("contract_modules", :module_id)
    create unique_index("contract_modules", [:module_id, :contract_id])
  end
end
