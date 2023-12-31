defmodule DoiEsper.Postgis.UsColleges do

  use Ecto.Schema

  schema "us_colleges" do
    field :name,           :string
    field :geom,           Geo.PostGIS.Geometry
  end
end
