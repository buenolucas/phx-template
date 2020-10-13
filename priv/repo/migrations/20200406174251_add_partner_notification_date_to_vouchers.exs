defmodule Arvore.Repo.Migrations.AddPartnerNotificationDateToVouchers do
  use Ecto.Migration

  def change do
    alter table("vouchers") do
      add(:partner_notification_date, :naive_datetime, default: nil)
    end
  end
end
