defmodule GoNorge.GoNorge.User do
  use Ecto.Schema
  import Ecto.Changeset

  @moduledoc """
  Représentation d'un utilisateur dans la base de données.
  """

  schema "users" do
    field :password, :string
    field :email, :string
    field :username, :string
    field :image_url, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :username, :password, :image_url])
    |> validate_required([:email, :username, :password])
  end
end
