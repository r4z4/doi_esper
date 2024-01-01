defmodule DoiEsper.Postgis.UsArenas do
  use Ecto.Schema
  alias __MODULE__

  schema "us_arenas" do
    field :stadium,         :string
    field :city,            :string
    field :state,           :string
    field :team,            :string
    field :conference,      :string
    field :capacity,        :string
    field :built,           :string
    field :expanded,        :string
    field :div,             :string
    field :latitude,        :string
    field :longitude,       :string
    field :geom,            Geo.PostGIS.Geometry
  end

  def get_coords(%{:lat => lat, :lon => lon}) do
    # IO.inspect(trips, label: "Trips")
    float_lat =
      lat
      |> String.trim()
      |> Float.parse()
      |> Kernel.elem(0)
    float_lon =
      lon
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
    |> Enum.map(fn(csv_list) -> %{stadium: Enum.at(csv_list, 0), city: Enum.at(csv_list, 1), state: Enum.at(csv_list, 2),
    team: Enum.at(csv_list, 3), conference: Enum.at(csv_list, 4), capacity: Enum.at(csv_list, 5), built: Enum.at(csv_list, 6), expanded: Enum.at(csv_list, 7),
    div: Enum.at(csv_list, 8), latitude: Enum.at(csv_list, 9), longitude: Enum.at(csv_list, 10), geom: %Geo.Point{coordinates: get_coords(%{:lat => Enum.at(csv_list, 9), :lon => Enum.at(csv_list, 10)}), srid: 4326}} end)
  end
end
