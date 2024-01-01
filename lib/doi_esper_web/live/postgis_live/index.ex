defmodule DoiEsperWeb.PostgisLive.Index do
  use DoiEsperWeb, :live_view
  alias DoiEsper.Postgis.PostgisTest
  alias DoiEsper.Postgis.UsHospitals
  alias DoiEsper.Repo
  import Ecto.Query
  import Geo.PostGIS

  @impl true
  def handle_event("service_casted", params, socket) do
    data =
      case Kernel.elem(Integer.parse(params["id"]), 0) do
        # GenServer.cast String.to_existing_atom(params["castto"]), {String.to_existing_atom(params["op"]), String.to_existing_atom(params["res"])}
        1 -> find_nearest("Doesnt Matter What Address")
        2 -> find_nearest("Doesnt Matter What Address")
        _ ->
          find_nearest("Doesnt Matter What Address")
      end
    IO.inspect(data, label: "Data")
    {:noreply,
      socket
      |> assign(postgis_data: data)}
  end

  def fetch_coords() do
    # FIXME fetch from API
    {44.458376, -93.161693}
  end

  def find_nearest(_addr) do
    coords = fetch_coords()
    point = %Geo.Point{coordinates: coords, srid: 4326}
    query = from hospital in UsHospitals, limit: 10, select: hospital.name, where: st_dwithin_in_meters(hospital.geom, ^point, 10000.0)
    query
    |> Repo.all
  end


  def example_query(geom) do
    # Just override it for now
    geom = %Geo.Point{coordinates: {-30, 90}, srid: 4326}
    query = from postgis_test in PostgisTest, limit: 1, select: st_distance(postgis_test.geom, ^geom)
    query
    |> Repo.one
  end

  def mount(_params, _session, socket) do
    geom = %Geo.Point{coordinates: {-30, 90}, srid: 4326}
    res = example_query(geom)
    {:ok,
      socket
      |> assign(:postgis_data, res)
    }
  end
end
