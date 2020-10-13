defmodule Arvore.Repo.Migrations.LastDayAccessToReader do
  use Ecto.Migration

  def change do
    alter table("subscription_reader_profiles") do
      add(:last_day_access, :date)
    end
  end
end
