defmodule Cuandoesquincena.Silly do

  def compiled_message, do: random_message() |> Earmark.to_html
  def random_message, do: messages() |> Enum.random

  def messages do
    File.stream!('shit_to_say.txt', [:read]) |> Stream.map(&String.strip/1)
  end
end
