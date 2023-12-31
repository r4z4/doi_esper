defmodule DoiEsper.Entities.Highways do
  use Ecto.Schema
  import Ecto.Changeset
  alias DoiEsper.Core.Utils

  @primary_key {:gid, :integer, autogenerate: false}
  @foreign_key_type :integer
  schema "highways" do
    field :feature, :string
    field :name, :string
    field :state, :string
    field :geom, Geo.PostGIS.Geometry
  end
end
