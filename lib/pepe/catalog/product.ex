defmodule Pepe.Catalog.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :description, :string
    field :name, :string
    field :sku, :integer
    field :unit_price, :float

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :unit_price, :description, :sku])
    |> validate_required([:name, :unit_price, :description, :sku])
    |> unique_constraint(:sku)
    |> validate_number(:unit_price, greater_than: 0.0)
  end

  def changeset_markdown(product, attrs) do
    product
    |> cast(attrs, [:unit_price])
    |> validate_markdown()
  end

  defp validate_markdown(changeset) do
    validate_change(changeset, :unit_price, fn _, value ->
      case value >= changeset.data.unit_price do
        true -> [{:unit_price, "New price should be lower than already marked price"}]
        _ -> []
      end
    end)
  end
end
