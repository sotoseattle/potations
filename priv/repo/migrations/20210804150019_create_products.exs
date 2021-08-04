defmodule Pepe.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :unit_price, :float
      add :description, :string
      add :sku, :integer

      timestamps()
    end

    create unique_index(:products, [:sku])
  end
end
