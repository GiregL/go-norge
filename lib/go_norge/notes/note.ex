defmodule GoNorge.Notes.Note do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :title, :string
    field :content, :string
    field :author_id, :id

    timestamps()
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:title, :content])
    |> validate_required([:title, :content])
  end
end
