defmodule DoiEsper.Sales.Sale do
  use Ecto.Schema

  schema "sale" do
    field :year, :integer
    field :month, :integer
    field :supplier, :string
    field :item_code, :integer
    field :item_description, :string
    field :item_type, :string
    field :retail_sales, :float
    field :retail_transfers, :float
    field :warehouse_sales, :integer
  end
end
