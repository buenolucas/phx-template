defmodule Arvore.Repo.Migrations.CreateAccessKeys do
  use Ecto.Migration

  def change do
    create table(:access_keys, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:key, :string, null: false)

      add(:b2b_subscription_account_id, references(:b2b_subscription_accounts, type: :id),
        null: false
      )

      timestamps([{:inserted_at, :created_at}])
    end
  end
end
