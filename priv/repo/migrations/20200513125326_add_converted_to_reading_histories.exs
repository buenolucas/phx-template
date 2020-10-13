defmodule Arvore.Repo.Migrations.AddConvertedToReadingHistories do
  use Ecto.Migration

  def change do
    alter table("reading_histories") do
      add(:converted_to_coins, :boolean, default: false)
    end

  end
end
