defmodule DoiEsper.Repo.Migrations.CreateState do
  use Ecto.Migration

  def change do
    create table(:state, primary_key: false) do
      add :id, :integer, primary_key: true
      add :name, :string
      add :code, :string
      add :num_districts, :integer
      add :governor, :string

      timestamps(null: [:updated_at])
    end

    create index(:state, [:name])
  end
end
