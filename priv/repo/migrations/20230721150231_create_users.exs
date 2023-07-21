defmodule GoNorge.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :username, :string, null: false
      add :password, :string, null: false
      add :image_url, :string

      timestamps()
    end
  end
end
