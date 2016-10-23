defmodule Cuandoesquincena.SillyMessage do
  use Cuandoesquincena.Web, :model

  schema "silly_messages" do
    field :message, :string
    field :votes, :integer
    field :approved, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:message, :votes, :approved])
    |> validate_required([:message, :votes, :approved])
  end
end
