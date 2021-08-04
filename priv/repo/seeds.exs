# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pepe.Repo.insert!(%Pepe.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Pepe.Catalog

products = [
  %{
    name: "Chess",
    sku: 12_870_123,
    unit_price: 10.00,
    description: "The classic strategy game"
  },
  %{
    name: "Tic Tac Toe",
    sku: 12_878_888,
    unit_price: 3.00,
    description: "The game of Xs and Os"
  },
  %{
    name: "Table Tennis",
    sku: 10_736_888,
    unit_price: 12.00,
    description: "Bat the ball, back and forth"
  }
]

Enum.each(products, fn product -> Catalog.create_product(product) end)
