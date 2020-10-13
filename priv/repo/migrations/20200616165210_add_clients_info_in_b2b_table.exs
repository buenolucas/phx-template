defmodule Arvore.Repo.Migrations.AddClientsInfoInB2bTable do
  use Ecto.Migration

  def change do
    alter table("b2b_subscription_accounts") do
      add(:who_pays, :string)
      add(:paying_client, :boolean, default: true)
      add(:responsible_name, :string)
      add(:responsible_email, :string)
      add(:internal_contacts, :map)
      add(:login_type, :map)
    end
  end
end
