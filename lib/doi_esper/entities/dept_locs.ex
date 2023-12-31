defmodule DoiEsper.Entities.DeptLocs do
  use Ecto.Schema
  import Ecto.Changeset
  alias DoiEsper.Core.Utils

  @primary_key {:id, :integer, autogenerate: false}
  @foreign_key_type :integer
  schema "dept_locs" do
    field :dept, :string
    field :geom, Geo.PostGIS.Geometry
  end
end
