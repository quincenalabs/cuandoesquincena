defmodule Cuandoesquincena.SillyMessageControllerTest do
  use Cuandoesquincena.ConnCase

  alias Cuandoesquincena.SillyMessage
  @valid_attrs %{approved: true, message: "some content", votes: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, silly_message_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    silly_message = Repo.insert! %SillyMessage{}
    conn = get conn, silly_message_path(conn, :show, silly_message)
    assert json_response(conn, 200)["data"] == %{"id" => silly_message.id,
      "message" => silly_message.message,
      "votes" => silly_message.votes,
      "approved" => silly_message.approved}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, silly_message_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, silly_message_path(conn, :create), silly_message: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(SillyMessage, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, silly_message_path(conn, :create), silly_message: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    silly_message = Repo.insert! %SillyMessage{}
    conn = put conn, silly_message_path(conn, :update, silly_message), silly_message: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(SillyMessage, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    silly_message = Repo.insert! %SillyMessage{}
    conn = put conn, silly_message_path(conn, :update, silly_message), silly_message: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    silly_message = Repo.insert! %SillyMessage{}
    conn = delete conn, silly_message_path(conn, :delete, silly_message)
    assert response(conn, 204)
    refute Repo.get(SillyMessage, silly_message.id)
  end
end
