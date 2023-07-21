defmodule GoNorgeWeb.AuthController do
  use GoNorgeWeb, :controller
  alias GoNorge.Repo
  alias GoNorge.GoNorge.User

  require Logger

  @moduledoc """
  Controller de gestion de l'authentification de l'utilisateur.
  """

  @doc """
  Affiche la page de login de l'utilisateur.
  """
  def show_login(conn, _param) do
    conn
    |> assign(:page_title, "Connexion")
    |> render(:login)
  end

  @spec process_login(Plug.Conn.t(), any) :: Plug.Conn.t()
  @doc """
  Traitement d'une requête de login sur l'application.
  """
  def process_login(conn, _param) do
    Logger.debug("Appel du controller de process de l'authentification de l'utilisateur.")

    email = conn.body_params["email"]
    motDePasse = conn.body_params["motDePasse"]

    result = Repo.get_by(User, [email: email, password: motDePasse])

    case result do
      nil ->
        Logger.debug("Utilisateur non trouvé: #{email}")
        redirect(conn, to: ~p"/login")
      %User{} = user ->
        Logger.debug("Utilisateur authentifié: #{email}")
        conn
        |> put_session(:logged_user, user)
        |> put_flash(:notice, "Vous êtes authentifié.")
        |> redirect(to: ~p"/")
      _ ->
        Logger.error("Une erreur est survenue: l'utilisateur attendu n'est ni nil ni un utilisateur.")
    end
  end

  @doc """
  Déconnecte l'utilisateur et le redirige sur la page d'accueil.
  """
  def logout(conn, _param) do
    conn
    |> delete_session(:logged_user)
    |> put_flash(:notice, "Vous avez été déconnecté.")
    |> redirect(to: ~p"/")
  end
end
