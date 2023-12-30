defmodule DoiEsper.Repo.Migrations.CreateThread do
  use Ecto.Migration

  def change do
    create table(:thread, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :creator, :binary_id
      add :content, :text
      add :likes, :integer, null: false, default: 0
      add :shares, :integer, null: false, default: 0
      add :forum_id, references(:forum, type: :binary_id, on_delete: :nothing)

      timestamps()
    end

    create index(:thread, [:id])
  end
end
