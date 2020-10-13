defmodule Arvore.Repo.Migrations.AddIndexToCurrentSignInAtUsers do
  use Ecto.Migration

  def change do
    create(index(:users, [:current_sign_in_at]))
  end
end
