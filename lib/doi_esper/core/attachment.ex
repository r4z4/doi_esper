defmodule DoiEsper.Core.Attachment do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__
  alias DoiEsper.Core.Error

  @title_min 2
  @title_max 20

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "attachments" do
    field :title, :string
    field :path, :string
    field :type, :integer
    field :data, :binary

    timestamps()
  end

  @spec validate_path!({:map, ErrorList}) :: {arg1, arg2} when arg1: :map, arg2: ErrorList
  defp validate_title!({object, err_props}) do
    title = object["title"]
    case is_binary(title) && String.length(title) in @title_min..@title_max do
      true -> {object, err_props}
      false ->
        err_props = Map.replace(err_props, :errors, [%Error{type: "Validation", text: "Invalid Title"} | err_props.errors])
        {object, err_props}
        # raise Error, %{type: "Path", text: "Hey"}
    end
  end

  @spec validate_path!({:map, ErrorList}) :: {arg1, arg2} when arg1: :map, arg2: ErrorList
  defp validate_path!({object, err_props}) do
    path = object["path"]
    case is_binary(path) && String.length(path) in @title_min..@title_max do
      true -> {object, err_props}
      false ->
        err_props = Map.replace(err_props, :errors, [%Error{type: "Validation", text: "Invalid Path"} | err_props.errors])
        {object, err_props}
        #raise Error, %{type: "Path", text: "Hey"}
    end
  end

  def to_attachment(object) do
    err_props = %{:errors => []}
    valid =
      {object, err_props}
      |> validate_title!()
      |> validate_path!()

    err_props = Kernel.elem(valid, 1)

    case List.first(err_props.errors) do
      nil ->
        %Attachment{
          id: object["id"],
          title: object["title"],
          path: object["path"],
          type: object["type"],
          data: object["data"],
        }
      _ -> err_props.errors

    end
  end
end
