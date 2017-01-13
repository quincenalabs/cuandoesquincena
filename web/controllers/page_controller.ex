defmodule Cuandoesquincena.PageController do
  use Cuandoesquincena.Web, :controller
  use Timex

  def index(conn, _params) do
    render conn, "index.html", calculator: calculator_data
  end

  def api(conn, _params) do
    json conn, calculator_data
  end

  def calculator_data do
    cal = Cuandoesquincena.Calculator

    %{
      today: cal.is_today?,
      seconds_until: cal.seconds_until,
      next_paydate: cal.next_real_paydate,
      last_paydate: cal.past_real_paydate,
      days_until: cal.days_until,
      current_date: cal.today,
      weekends: cal.weekends,
      next_paypal: cal.next_paypal_paydate
    }
  end
end
