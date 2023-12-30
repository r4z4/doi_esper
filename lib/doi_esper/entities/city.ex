defmodule DoiEsper.Entities.City do
  @enforce_keys [:name, :latitude, :longitude, :population, :median_age, :median_income]
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__
  alias DoiEsper.Core.Utils
  alias DoiEsper.Core.Error

  @pop_min 40
  @pop_max 9_000_000
  @name_min 2
  @name_max 27

  schema "city" do
    field :name, :string
    field :state, Ecto.Enum, values: Utils.states
    field :latitude, :float
    field :longitude, :float
    field :population, :integer
    field :median_age, :integer
    field :median_income, :integer
  end

    @doc false
    def changeset(city, attrs) do
      city
      |> cast(attrs, [:name, :state, :latitude, :longitude, :population, :median_age, :median_income])
      |> validate_required([:name, :state, :population])
    end

  @spec validate_name({:map, ErrorList}) :: {arg1, arg2} when arg1: :map, arg2: ErrorList
  defp validate_name({object, err_props}) do
    name = object["name"]
    case is_binary(name) && String.length(name) in @name_min..@name_max do
      true -> {object, err_props}
      false ->
        err_props = Map.replace(err_props, :errors, [%Error{type: "Validation", text: "Invalid Name"} | err_props.errors])
        {object, err_props}
    end
  end

  # defp validate_to!({object, err_props}) do
  #   raise Error, %{type: "Path", text: "Hey"}
  # end

  @spec validate_population({:map, ErrorList}) :: {arg1, arg2} when arg1: :map, arg2: ErrorList
  defp validate_population({object, err_props}) do
    population = object["population"]
    case is_integer(population) do
      true ->
        case population in @pop_min..@pop_max do
          true -> {object, err_props}
          false ->
            err_props = Map.replace(err_props, :errors, [%Error{type: "Validation", text: "Invalid Population Size"} | err_props.errors])
            {object, err_props}
        end
      false ->
        err_props = Map.replace(err_props, :errors, [%Error{type: "Validation", text: "Invalid Population Type"} | err_props.errors])
        {object, err_props}
    end
  end

  @spec validate_state({:map, ErrorList}) :: {arg1, arg2} when arg1: :map, arg2: ErrorList
  defp validate_state({object, err_props}) do
    state = object["state"]
    case is_atom(state) do
      true ->
        case state in Utils.states do
          true -> {object, err_props}
          false ->
            err_props = Map.replace(err_props, :errors, [%Error{type: "Validation", text: "Invalid State"} | err_props.errors])
            {object, err_props}
        end
      false ->
        err_props = Map.replace(err_props, :errors, [%Error{type: "Validation", text: "Invalid State Type"} | err_props.errors])
        {object, err_props}
    end
  end

  def new(object) do
    err_props = %{:errors => []}
    valid =
      {object, err_props}
      |> validate_name()
      |> validate_population()
      |> validate_state()

    err_props = Kernel.elem(valid, 1)

    case List.first(err_props.errors) do
      # No errors, create Struct
      nil ->
        %City{
          # id: object["id"],
          name: object["name"],
          state: object["state"],
          latitude: object["latitude"],
          longitude: object["longitude"],
          population: object["population"],
          median_age: object["median_age"],
          median_income: object["median_income"],
        }
      # Return errors if errors in the error list
      _ -> err_props.errors

    end
  end
end
