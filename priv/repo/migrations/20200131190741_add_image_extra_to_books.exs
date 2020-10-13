defmodule Arvore.Repo.Migrations.AddImageExtraToBooks do
  use Ecto.Migration

  def change do
    alter table("books") do
      add(:image_extra, :string)
    end
  end
end
