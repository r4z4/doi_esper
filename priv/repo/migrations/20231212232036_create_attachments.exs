defmodule DoiEsper.Repo.Migrations.CreateAttachments do
  use Ecto.Migration

  def change do
    create table(:attachments, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :path, :string
      add :type, :integer
      add :data, :binary

      timestamps()
    end
  end
end
