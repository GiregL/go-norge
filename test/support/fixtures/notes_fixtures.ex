defmodule GoNorge.NotesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GoNorge.Notes` context.
  """

  @doc """
  Generate a note.
  """
  def note_fixture(attrs \\ %{}) do
    {:ok, note} =
      attrs
      |> Enum.into(%{
        title: "some title",
        content: "some content"
      })
      |> GoNorge.Notes.create_note()

    note
  end
end
