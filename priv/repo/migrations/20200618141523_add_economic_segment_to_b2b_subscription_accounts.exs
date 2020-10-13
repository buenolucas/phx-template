defmodule Arvore.Repo.Migrations.AddEconomicSegmentToB2bSubscriptionAccounts do
  use Ecto.Migration

  def change do
    alter table("b2b_subscription_accounts") do
      add(:economic_segment, :string)
    end
  end
end
