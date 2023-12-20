defmodule DoiEsper.Sales.TownData do
  use Ecto.Schema

  schema "town_data" do
    field :year, :integer
    field :code, :integer
    field :town, :string
    field :_2010_census, :integer
    field :gov_assisted, :integer
    field :tenant_rental_assistance, :integer
    field :chfa_usda_mortgages, :integer
    field :deed_restricted, :integer
    field :total_assisted, :integer
    field :percent_assisted, :float
  end
end
