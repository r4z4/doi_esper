defmodule DoiEsper.Repo.Migrations.CreateLuDepts do
  use Ecto.Migration

  def up do
    create table(:lu_depts, primary_key: false) do
      add :id,     :string, primary_key: true
      add :dept,   :string
    end
  end

  def down do
    drop table(:lu_depts)
  end
end
