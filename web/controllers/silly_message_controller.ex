defmodule Cuandoesquincena.SillyMessageController do
  use Cuandoesquincena.Web, :controller

  alias Cuandoesquincena.SillyMessage

  def index(conn, _params) do
    silly_messages = Repo.all(SillyMessage)
    render(conn, "index.json", silly_messages: silly_messages)
  end

  def rand(conn, _params) do
    silly_message = Cuandoesquincena.SillyMessage.Queries.random
    render(conn, "show.json", silly_message: silly_message)
  end


  def create(conn, %{"silly_message" => silly_message_params}) do
    changeset = SillyMessage.changeset(%SillyMessage{}, silly_message_params)

    case Repo.insert(changeset) do
      {:ok, silly_message} ->
	conn
	|> put_status(:created)
	|> put_resp_header("location", silly_message_path(conn, :show, silly_message))
	|> render("show.json", silly_message: silly_message)
      {:error, changeset} ->
	conn
	|> put_status(:unprocessable_entity)
	|> render(Cuandoesquincena.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    silly_message = Repo.get!(SillyMessage, id)
    render(conn, "show.json", silly_message: silly_message)
  end

end
