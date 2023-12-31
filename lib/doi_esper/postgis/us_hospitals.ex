defmodule DoiEsper.Postgis.UsHospitals do

  use Ecto.Schema

  schema "us_hospitals" do
    field :name,           :string
    field :geom,           Geo.PostGIS.Geometry
  end
end
