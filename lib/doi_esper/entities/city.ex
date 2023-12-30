defmodule DoiEsper.Entities.City do
  @enforce_keys [:name, :latitude, :longitude, :population, :median_age, :median_income]
  use Ecto.Schema

  schema "city" do
    field :name, :string
    field :latitude, :float
    field :longitude, :float
    field :population, :integer
    field :median_age, :integer
    field :median_income, :integer
  end
end
