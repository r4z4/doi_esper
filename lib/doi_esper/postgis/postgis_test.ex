defmodule DoiEsper.Postgis.PostgisTest do
  Postgrex.Types.define(DoiEsper.PostgresTypes,
    [Geo.PostGIS.Extension] ++ Ecto.Adapters.Postgres.extensions(),
    json: Jason)

  use Ecto.Schema

  schema "postgis_test" do
    field :name,           :string
    field :geom,           Geo.PostGIS.Geometry
  end
end
