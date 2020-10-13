defmodule Arvore.Repo.Migrations.AddPermissionToSubscriptionReaderProfiles do
  use Ecto.Migration

  def change do
    alter table("subscription_reader_profiles") do
      add(:permissions, :string, default: "")
    end
  end
end
