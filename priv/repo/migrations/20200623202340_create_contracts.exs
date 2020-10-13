defmodule Arvore.Repo.Migrations.CreateContracts do
  use Ecto.Migration

  def change do
    create table(:contracts) do
      add(:entity_id, :integer)
      add(:type, :string)
      add(:active, :boolean)
      add(:book_collection, :string)
      add(:company_name, :string)
      add(:trading_name, :string)
      add(:cnpj, :string)
      add(:state_registration, :string)
      add(:billing_address_id, :integer)
      add(:signature_date, :date)
      add(:start_date, :date)
      add(:end_date, :date)
      add(:expiration_warning_days, :integer)
      add(:disable_users_after_expiration, :boolean)
      add(:finance_contact_name, :string)
      add(:finance_contact_email, :string)
      add(:finance_contact_phone, :string)
      add(:observation, :string)

      timestamps([{:inserted_at, :created_at}])
    end

    create(index(:contracts, :entity_id))
  end
end
