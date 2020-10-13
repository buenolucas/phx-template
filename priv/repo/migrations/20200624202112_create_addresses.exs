defmodule Arvore.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add(:address, :string)
      add(:number, :string)
      add(:complement, :string)
      add(:neighborhood, :string)
      add(:city, :string)
      add(:state, :string)
      add(:country, :string)
      add(:zipcode, :string)

      timestamps([{:inserted_at, :created_at}])
    end
  end
end
