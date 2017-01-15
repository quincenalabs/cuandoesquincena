defmodule Cuandoesquincena.PageView do
  use Cuandoesquincena.Web, :view

  def today?(calculator) do
    calculator.is_today?
  end

  def paypal?(path), do: String.contains?(path, "paypal")

end
