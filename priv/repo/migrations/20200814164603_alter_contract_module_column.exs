defmodule Arvore.Repo.Migrations.AlterContractModuleColumn do
  use Ecto.Migration

  def up do
    execute("ALTER TABLE contract_modules Change name module_id int(11);")
  end

  def down do
    execute("ALTER TABLE contract_modules Change module_id name varchar(50);")
  end
end
