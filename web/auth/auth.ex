defmodule Cuandoesquincena.Authenticate do
  import Plug.Conn
  import Phoenix.Controller
  import Cuandoesquincena.Session


  def init(default), do: default

  def call(conn, default) do
    current_user = current_user conn

    if current_user do
      assign(conn, :current_user, current_user)
    else
      conn
	|> put_flash(:error, 'You need to be signed in to view this page')
	|> redirect(to: Cuandoesquincena.Router.Helpers.session_path(conn, :new))
    end
  end
end
