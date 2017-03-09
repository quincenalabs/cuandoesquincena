defmodule Cuandoesquincena.Notify do
  use Timex
  import OneSignal.Param

  #ando de weba hoy :( imperativo sera
  def daily_summary do
    cal = Cuandoesquincena.Calculator

    if cal.is_today? do          
      OneSignal.new
      |> put_heading("¿Hoy es Quincena?")
      |> put_message("SI! Felicidades sobreviviste otros 15 días mas 😉")
      |> put_segment("All")
      |> notify
    else   
      OneSignal.new
      |> put_heading("¿Hoy es Quincena? 🤑")
      |> put_message("¡No! #{Cuandoesquincena.SillyMessage.Queries.random.message}")
      |> put_segment("All")
      |> notify
    end
  end
end

