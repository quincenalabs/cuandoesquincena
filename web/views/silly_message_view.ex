defmodule Cuandoesquincena.SillyMessageView do
  use Cuandoesquincena.Web, :view

  def render("index.json", %{silly_messages: silly_messages}) do
    %{data: render_many(silly_messages, Cuandoesquincena.SillyMessageView, "silly_message.json")}
  end

  def render("show.json", %{silly_message: silly_message}) do
    %{data: render_one(silly_message, Cuandoesquincena.SillyMessageView, "silly_message.json")}
  end

  def render("silly_message.json", %{silly_message: silly_message}) do
    %{id: silly_message.id,
      message: silly_message.message,
      votes: silly_message.votes,
      approved: silly_message.approved}
  end
end
