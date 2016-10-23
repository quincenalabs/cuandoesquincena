defmodule Cuandoesquincena.Repo.Migrations.CreateSillyMessage do
  use Ecto.Migration

  def change do
    create table(:silly_messages) do
      add :message, :string
      add :votes, :integer
      add :approved, :boolean, default: false, null: false

      timestamps()
    end

  end
end
