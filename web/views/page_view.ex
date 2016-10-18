defmodule Cuandoesquincena.PageView do
  use Cuandoesquincena.Web, :view

  def today?(calculator) do
    calculator.is_today?
  end
end
