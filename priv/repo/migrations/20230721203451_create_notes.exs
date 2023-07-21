defmodule GoNorge.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :title, :string
      add :content, :string
      add :author_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:notes, [:author_id])
  end
end
