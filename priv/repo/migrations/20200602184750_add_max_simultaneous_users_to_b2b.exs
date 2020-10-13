defmodule Arvore.Repo.Migrations.AddMaxSimultaneousUsersToB2b do
  use Ecto.Migration

  def change do
    alter table("b2b_subscription_accounts") do
      add(:max_simultaneous_users, :integer)
    end
  end
end
