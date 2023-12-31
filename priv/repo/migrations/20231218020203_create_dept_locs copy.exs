defmodule DoiEsper.Repo.Migrations.CreateDeptLocs do
  use Ecto.Migration

  def up do
    create table(:dept_locs, primary_key: false) do
      add :id,     :integer, primary_key: true, autogenerate: true
      # Cascade = Update_All
      add :dept,   references(:lu_depts, type: :string, on_update: :update_all, on_delete: :restrict), null: false
      add :geom,   :geometry
    end
  end

  def down do
    drop table(:dept_locs)
  end
end
