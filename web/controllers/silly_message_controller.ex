defmodule Cuandoesquincena.SillyMessageController do
  use Cuandoesquincena.Web, :controller

  def rand(conn, _params) do
    silly_message = Cuandoesquincena.Silly.compiled_message
    render(conn, "show.json", %{silly_message: silly_message})
  end
end
