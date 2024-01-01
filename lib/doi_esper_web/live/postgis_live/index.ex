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

  def addr_to_params(addr) do
    addr
    |> String.replace(~r"[,.]", "")
    |> String.replace(" ", "+")
  end

  def fetch_coords(addr_input) do
    # FIXME fetch from API
    # Bad Address returns empty list
    base_url = "https://geocode.maps.co/search?q="
    addr_params = addr_to_params(addr_input)
    api_key = System.fetch_env!("GEOCODE_API_KEY")
    url  = base_url <> addr_params <> "+US&api_key=" <> api_key
    # url = "https://geocode.maps.co/search?q=1300+St+Olaf+Ave+Northfield+MN+55057+US&api_key="
    # [
    #   {"place_id":333087840,"licence":"Data © OpenStreetMap contributors, ODbL 1.0. https://osm.org/copyright","osm_type":"way","osm_id":235569737,"boundingbox":["44.460514","44.4605768","-93.176094","-93.161441"],"lat":"44.460567","lon":"-93.168335",
    #   "display_name":"Saint Olaf Avenue, Northfield, Rice County, Minnesota, 55057, United States","class":"highway","type":"tertiary","importance":0.6200099999999998}
    # ]

    IO.inspect(url, label: "URL")

    {:ok, resp} =
      Finch.build(
        :get,
        url,
        [{"Accept", "application/json"}]
        )
        |> Finch.request(DoiEsper.Finch)

    IO.inspect(resp, label: "Resp")

    {:ok, body} = Jason.decode(resp.body)
    IO.inspect(body, label: "Body")

    # Alwaus get first
    res = List.first(body)

    lat =
      res["lat"]
      |> Float.parse()
      |> Kernel.elem(0)

    lon =
      res["lon"]
      |> Float.parse()
      |> Kernel.elem(0)

    {lat, lon}

    # {44.458376, -93.161693}
  end

  def find_nearest(_addr) do
    addr_input = "7724 Pine Cir Omaha NE 68124"
    coords = fetch_coords(addr_input)
    IO.inspect(coords, label: "Coords")
    point = %Geo.Point{coordinates: coords, srid: 4326}
    query = from hospital in UsHospitals, limit: 10, select: [hospital.name, st_distance(hospital.geom, ^point)], where: st_dwithin_in_meters(hospital.geom, ^point, 10000.0), order_by: [desc: st_distance(hospital.geom, ^point)]
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
      |> assign(:postgis_data, nil)
      |> assign(:form, %{address: nil})
    }
  end

  def handle_event("submit", params, socket) do
    IO.puts("Test")
  end

  def handle_event("validate", %{"address" => address}, socket) do
    # form =
    #   %User{}
    #   |> Accounts.change_user(params)
    #   |> Map.put(:action, :insert)
    #   |> to_form()
    IO.inspect(address, label: "Params")
    form = %{address: address}

    {:noreply, assign(socket, form: form)}
  end
end
