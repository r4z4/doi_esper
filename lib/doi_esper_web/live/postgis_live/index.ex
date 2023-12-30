defmodule DoiEsperWeb.PostgisLive.Index do
  use DoiEsperWeb, :live_view
  alias DoiEsper.Postgis.PostgisTest
  alias DoiEsper.Repo
  import Ecto.Query
  import Geo.PostGIS

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
