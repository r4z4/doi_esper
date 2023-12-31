defmodule DoiEsper.Entities.LuDepts do
  use Ecto.Schema
  import Ecto.Changeset
  alias DoiEsper.Core.Utils

  @primary_key {:id, :string, autogenerate: false}
  @foreign_key_type :string
  schema "lu_depts" do
    field :dept, :string
  end
end
