defmodule DoiEsper.Postgis.Geocode do
  use Ecto.Schema

  schema "geocode" do
    field :boundingbox,    {:array, :string}
    field :class,          :string
    field :display_name,   :string
    field :importance,     :float
    field :lat,            :string
    field :licence,        :string
    field :lon,            :string
    field :osm_id,         :integer
    field :osm_type,       :string
    field :place_id,       :integer
    field :type,           :string
  end
end

# %{
#   "boundingbox" => ["44.460514", "44.4605768", "-93.176094", "-93.161441"],
#   "class" => "highway",
#   "display_name" => "Saint Olaf Avenue, Northfield, Rice County, Minnesota, 55057, United States",
#   "importance" => 0.6200099999999998,
#   "lat" => "44.460567",
#   "licence" => "Data © OpenStreetMap contributors, ODbL 1.0. https://osm.org/copyright",
#   "lon" => "-93.168335",
#   "osm_id" => 235569737,
#   "osm_type" => "way",
#   "place_id" => 333087840,
#   "type" => "tertiary"
# },
