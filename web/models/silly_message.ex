defmodule Cuandoesquincena.SillyMessage do
  use Cuandoesquincena.Web, :model
  alias Ecto.Adapters.SQL
  alias Cuandoesquincena.Repo

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
    |> cast(params, [:message])
    |> validate_required([:message])
  end

  defmodule Queries do
    def random do
      Repo.all(from s in Cuandoesquincena.SillyMessage, order_by: fragment("RANDOM()"), limit: 1) |> List.first
    end
  end
end
