defmodule DoiEsper.Repo.Migrations.AddUsername do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :username, :string, null: false, default: false
      add :city, :string, null: false, default: "Omaha"
      add :state, :string, null: false, default: "NE"
      add :district, :integer, null: true
    end

    create unique_index(:users, [:username])
  end
end
