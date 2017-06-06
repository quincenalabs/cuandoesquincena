defmodule Cuandoesquincena.Silly do

  def compiled_message, do: random_message() |> Earmark.to_html
  def random_message, do: messages() |> Enum.random

  def messages do
    case :ets.lookup(:jokes, :all_jokes) do
      [{:all_jokes, jokes}] -> jokes
      [] -> fetch_store_from_file()
    end
  end

  def fetch_store_from_file do
    all_valid_jokes = valid_jokes
    :ets.insert(:jokes, {:all_jokes, all_valid_jokes})
    all_valid_jokes
  end

  def valid_jokes, do: read_jokes_file() |> Enum.reject(fn(s) -> String.length(s) ==0 end)
  
  def read_jokes_file do
    File.stream!('shit_to_say.txt', [:read]) |> Stream.map(&String.strip/1)
  end
end
