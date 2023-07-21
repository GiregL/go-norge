defmodule GoNorgeWeb.MainController do
  use GoNorgeWeb, :controller

  @moduledoc """
  Controller de base de l'application.

  Il est chargé d'afficher la page d'accueil de l'application.
  """

  @doc """
  Affiche la page d'accueil de l'application.
  """
  def index(conn, _params) do
    conn
    |> assign(:page_title, "Accueil")
    |> render(:index)
  end
end
