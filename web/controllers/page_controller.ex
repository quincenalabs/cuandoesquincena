defmodule Cuandoesquincena.PageController do
  use Cuandoesquincena.Web, :controller
  use Timex

  def index(conn, _params) do
    render conn, "index.html", calculator: calculator_data, request_path: conn.request_path
  end

  def api(conn, _params) do
    json conn, calculator_data
  end

  def calculator_data do
    cal = Cuandoesquincena.Calculator

    %{
      today: cal.is_today?,
      today_paypal: cal.is_today_paypal?,
      seconds_until: cal.seconds_until,
      next_paydate: cal.next_real_paydate,
      last_paydate: cal.past_real_paydate,
      days_until: cal.days_until,
      current_date: cal.today,
      weekends: cal.weekends,
      next_paypal: cal.next_paypal_paydate,
      next_canonical: cal.today |> cal.next_canonical_payday_from_today
    }
  end
end
