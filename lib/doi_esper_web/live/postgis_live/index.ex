defmodule DoiEsperWeb.PostgisLive.Index do
  use DoiEsperWeb, :live_view
  alias DoiEsper.Postgis.PostgisTest
  alias DoiEsper.Postgis.UsHospitals
  alias DoiEsper.Postgis.UsColleges
  alias DoiEsper.Repo
  import Ecto.Query
  import Geo.PostGIS

  @impl true
  def handle_event("service_casted", params, socket) do
    entity = :hospital
    addr = "7724 Pine Circle Omaha NE 68124"
    data =
      case Kernel.elem(Integer.parse(params["id"]), 0) do
        # GenServer.cast String.to_existing_atom(params["castto"]), {String.to_existing_atom(params["op"]), String.to_existing_atom(params["res"])}
        1 -> find_nearest(addr, entity)
        2 -> find_nearest(addr, entity)
        _ -> find_nearest(addr, entity)
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

    coords =
      case res do
        nil -> {0.0, 0.0}
          _ ->
            lat =
              res["lat"]
              |> Float.parse()
              |> Kernel.elem(0)

            lon =
              res["lon"]
              |> Float.parse()
              |> Kernel.elem(0)

            {lat, lon}
      end
    # {44.458376, -93.161693}
    coords
  end

  def find_nearest(addr, entity) do
    # addr_input = "7724 Pine Cir Omaha NE 68124"
    coords = fetch_coords(addr)
    IO.inspect(coords, label: "Coords")
    case coords do
      # Our error case
      {0.0, 0.0} -> [["No Results", 0.0]]
      _ ->
        point = %Geo.Point{coordinates: coords, srid: 4326}
        query =
          case entity do
            :hospital -> from hospital in UsHospitals, limit: 10, select: [hospital.name, st_distance(hospital.geom, ^point)], where: st_dwithin_in_meters(hospital.geom, ^point, 10000.0), order_by: [desc: st_distance(hospital.geom, ^point)]
            :college -> from college in UsColleges, limit: 10, select: [college.name, st_distance(college.geom, ^point)], where: st_dwithin_in_meters(college.geom, ^point, 10000.0), order_by: [desc: st_distance(college.geom, ^point)]
            _ -> from hospital in UsHospitals, limit: 10, select: [hospital.name, st_distance(hospital.geom, ^point)], where: st_dwithin_in_meters(hospital.geom, ^point, 10000.0), order_by: [desc: st_distance(hospital.geom, ^point)]
          end
        # query = from hospital in UsHospitals, limit: 10, select: [hospital.name, st_distance(hospital.geom, ^point)], where: st_dwithin_in_meters(hospital.geom, ^point, 10000.0), order_by: [desc: st_distance(hospital.geom, ^point)]
        query
        |> Repo.all
    end
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
      |> assign(:form, %{address: nil, valid: false, city: nil, state: nil, zip: nil})
    }
  end

  def handle_event("validate", %{"address" => address}, socket) do
    # form =
    #   %User{}
    #   |> Accounts.change_user(params)
    #   |> Map.put(:action, :insert)
    #   |> to_form()
    IO.inspect(address, label: "Params")
    # FIXME: Make the N/S optional
    pattern = ~r/\d{1,5}\s(\w?.?)?\s?(\b\w*\b\s){1,2}\w*\.?/
    valid = String.match?(address, pattern)
    form = %{address: address, valid: valid}

    {:noreply, assign(socket, form: form)}
  end

  def handle_event("submit", params, socket) do
    IO.inspect(params, label: "Params")
    addr = params["address"]
    city = params["city"]
    state = params["state"]
    zip = params["zip"]
    entity = :hospital
    address = addr <> " " <> city <> " " <> state <> " " <> zip
    IO.inspect(address, label: "Address")
    data = find_nearest(address, entity)
    IO.inspect(data, label: "Data")
    {:noreply,
      socket
      |> assign(postgis_data: data)}
  end
end
