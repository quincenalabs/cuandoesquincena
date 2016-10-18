defmodule Cuandoesquincena.Silly do
  def clasic_random_message do
    clasic_messages |> Enum.random
  end

  def clasic_messages do
    ["¡Eso quisieras!",
     "¡No hay para el abono de los zapatos!",
     "¿Y el pago de Coppel?",
     "Adivina: ¿Quién va a comer maruchanes los siguientes tres dias?"]
  end
end
