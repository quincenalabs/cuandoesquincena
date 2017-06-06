defmodule Cuandoesquincena.SillyMessageView do
  use Cuandoesquincena.Web, :view

  def render("show.json", %{silly_message: silly_message}) do
    %{data: render_one(silly_message, Cuandoesquincena.SillyMessageView, "silly_message.json")}
  end
  
  def render("silly_message.json", %{silly_message: silly_message}) do
    %{ message: silly_message }
  end
end
