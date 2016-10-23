defmodule Cuandoesquincena.SillyMessageTest do
  use Cuandoesquincena.ModelCase

  alias Cuandoesquincena.SillyMessage

  @valid_attrs %{approved: true, message: "some content", votes: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = SillyMessage.changeset(%SillyMessage{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = SillyMessage.changeset(%SillyMessage{}, @invalid_attrs)
    refute changeset.valid?
  end
end
