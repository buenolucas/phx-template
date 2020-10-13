defmodule Arvore.Repo.Migrations.AddIndexToUsersExternalId do
  use Ecto.Migration

  def change do
    create unique_index("users", [:external_id])
  end
end
