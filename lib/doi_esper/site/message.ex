defmodule DoiEsper.Site.Message do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias __MODULE__
  alias DoiEsper.Repo
  alias DoiEsper.Core.Utils
  alias DoiEsper.Core.Error
  alias DoiEsper.Core.ErrorList

  @id_len 36
  @subject_min 2
  @subject_max 20

  @primary_key {:id, UUIDv7, autogenerate: true}
  schema "message" do
    field :to, :binary_id
    field :from, :binary_id
    field :subject, :string
    field :type, Ecto.Enum, values: Utils.message_type
    field :text, :string
    field :read, :boolean
    field :saved, :boolean

    timestamps(only: :updated_at)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:id, :to, :from, :subject, :type, :text, :read, :saved])
    |> validate_required([:to, :from, :id, :type])
  end

  @spec validate_required_fields({:map, ErrorList}) :: {arg1, arg2} when arg1: :map, arg2: ErrorList
  defp validate_required_fields({object, err_props}) do
    required_fields = [:to, :from, :subject]
    missing = Enum.map(required_fields, fn field ->
      res = Map.fetch(object, field)
      # IO.inspect(res, label: "Res")
      case res do
        {:ok, nil} -> field
        {:ok, _val} -> nil
        :error -> field
        _ -> field
      end
    end)
    # IO.inspect(missing, label: "Missing")
    case Enum.any?(missing) do
      false -> {:ok, {object, err_props}}
      true  ->
        err_props = Map.replace(err_props, :errors, [%Error{type: :validation, text: "Missing Fields: #{Utils.display_missing_fields(missing)}"} | err_props.errors])
        {:error, {object, err_props}}
    end
  end

  @spec validate_from({:map, ErrorList}) :: {arg1, arg2} when arg1: :map, arg2: ErrorList
  defp validate_from({object, err_props}) do
    from = object.from
    case is_binary(from) && String.length(from) == @id_len do
      true -> {object, err_props}
      false ->
        err_props = Map.replace(err_props, :errors, [%Error{type: :validation, text: "Invalid From"} | err_props.errors])
        {object, err_props}
    end
  end

  @spec validate_type({:map, ErrorList}) :: {arg1, arg2} when arg1: :map, arg2: ErrorList
  defp validate_type({object, err_props}) do
    type = object.type
    case is_atom(type) && type in Utils.message_type() do
      true -> {object, err_props}
      false ->
        err_props = Map.replace(err_props, :errors, [%Error{type: :validation, text: "Invalid Message Type"} | err_props.errors])
        {object, err_props}
    end
  end

  # defp validate_to!({object, err_props}) do
  #   raise Error, %{type: "Path", text: "Hey"}
  # end

  @spec validate_to({:map, ErrorList}) :: {arg1, arg2} when arg1: :map, arg2: ErrorList
  defp validate_to({object, err_props}) do
    to = object.to
    case is_binary(to) && String.length(to) == @id_len do
      true -> {object, err_props}
      false ->
        err_props = Map.replace(err_props, :errors, [%Error{type: :validation, text: "Invalid To"} | err_props.errors])
        {object, err_props}
    end
  end

  @spec validate_subject({:map, ErrorList}) :: {arg1, arg2} when arg1: :map, arg2: ErrorList
  defp validate_subject({object, err_props}) do
    subject = object.subject
    case is_binary(subject) do
      true ->
        case String.length(subject) in @subject_min..@subject_max do
          true -> {object, err_props}
          false ->
            err_props = Map.replace(err_props, :errors, [%Error{type: :validation, text: "Invalid Subject Length"} | err_props.errors])
            {object, err_props}
        end
      false ->
        err_props = Map.replace(err_props, :errors, [%Error{type: :validation, text: "Invalid Subject Type"} | err_props.errors])
        {object, err_props}
    end
  end

  def new(object) do
    err_props = %{:errors => []}
    valid =
      case validate_required_fields({object, err_props}) do
        # Only further validate if the fields are present. Avoids a nil check in each.
        {:ok, {object, err_props}} ->
          {object, err_props}
          |> validate_to()
          |> validate_from()
          |> validate_type()
          |> validate_subject()
        {:error, {object, err_props}} ->
          {object, err_props}
      end

    err_props = Kernel.elem(valid, 1)

    case List.first(err_props.errors) do
      # No errors, create Struct
      nil ->
        %Message{
          id: object.id,
          to: object.to,
          from: object.from,
          subject: object.subject,
          type: object.type,
          text: object.text,
          read: object.read,
          saved: object.saved,
        }
      # Return errors if errors in the error list
      _ -> err_props.errors

    end
  end
end
