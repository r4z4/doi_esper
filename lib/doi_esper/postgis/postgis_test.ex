defmodule DoiEsper.Postgis.PostgisTest do
  use Ecto.Schema

  schema "postgis_test" do
    field :name,           :string
    field :geom,           Geo.PostGIS.Geometry
  end

  def get_coords(trips) do
    # IO.inspect(trips, label: "Trips")
    float_lat =
      Enum.at(trips, 1)
      |> String.trim()
      |> Float.parse()
      |> Kernel.elem(0)
    float_lon =
      Enum.at(trips, 2)
      |> String.trim()
      |> Float.parse()
      |> Kernel.elem(0)

    {float_lat, float_lon}
  end

  def csv_to_table_objects(csv_path) do
    csv_path
    |> Path.expand(__DIR__)
    |> File.stream!
    |> Stream.drop(1)
    |> Stream.map(&String.trim(&1, "\n"))
    |> Stream.map(&String.split(&1, ","))
    |> Enum.map(fn(trips) -> %{name: Enum.at(trips, 0), geom: %Geo.Point{coordinates: get_coords(trips), srid: 4326}} end)
  end
end
