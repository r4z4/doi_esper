defmodule DoiEsper.Core.Attachment do
  use Ecto.Schema
  alias __MODULE__

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "attachments" do
    field :title, :string
    field :path, :string
    field :type, :integer
    field :data, :binary

    timestamps()
  end

  def to_attachment(%{"id" => id, "title" => title, "path" => path, "type" => type, "data" => data}) do

    %Attachment{
      id: id,
      title: title,
      path: path,
      type: type,
      data: data,
    }
  end
end
