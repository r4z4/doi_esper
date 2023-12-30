defmodule DoiEsper.Repo.Migrations.AddUsername do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :username, :string, null: false, default: false
      add :f_name, :string, null: true
      add :l_name, :string, null: true
      add :city, :string, null: false, default: "Omaha"
      add :state, :string, null: false, default: "NE"
    end

    create unique_index(:users, [:username])
  end
end
