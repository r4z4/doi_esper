defmodule DoiEsper.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:post, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string, null: false
      add :author, :binary_id, null: false
      add :content, :text, null: false
      add :upvotes, :integer, null: false, default: 0
      add :downvotes, :integer, null: false, default: 0
      add :thread_id, references(:thread, type: :binary_id, on_delete: :nothing)

      timestamps()
    end

    create index(:post, [:id])
  end
end
