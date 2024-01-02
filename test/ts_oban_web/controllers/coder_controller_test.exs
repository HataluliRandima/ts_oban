defmodule TsObanWeb.CoderControllerTest do
  use TsObanWeb.ConnCase

  import TsOban.CodersFixtures

  @create_attrs %{name: "some name", position: "some position", email: "some email"}
  @update_attrs %{name: "some updated name", position: "some updated position", email: "some updated email"}
  @invalid_attrs %{name: nil, position: nil, email: nil}

  describe "index" do
    test "lists all coders", %{conn: conn} do
      conn = get(conn, ~p"/coders")
      assert html_response(conn, 200) =~ "Listing Coders"
    end
  end

  describe "new coder" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/coders/new")
      assert html_response(conn, 200) =~ "New Coder"
    end
  end

  describe "create coder" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/coders", coder: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/coders/#{id}"

      conn = get(conn, ~p"/coders/#{id}")
      assert html_response(conn, 200) =~ "Coder #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/coders", coder: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Coder"
    end
  end

  describe "edit coder" do
    setup [:create_coder]

    test "renders form for editing chosen coder", %{conn: conn, coder: coder} do
      conn = get(conn, ~p"/coders/#{coder}/edit")
      assert html_response(conn, 200) =~ "Edit Coder"
    end
  end

  describe "update coder" do
    setup [:create_coder]

    test "redirects when data is valid", %{conn: conn, coder: coder} do
      conn = put(conn, ~p"/coders/#{coder}", coder: @update_attrs)
      assert redirected_to(conn) == ~p"/coders/#{coder}"

      conn = get(conn, ~p"/coders/#{coder}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, coder: coder} do
      conn = put(conn, ~p"/coders/#{coder}", coder: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Coder"
    end
  end

  describe "delete coder" do
    setup [:create_coder]

    test "deletes chosen coder", %{conn: conn, coder: coder} do
      conn = delete(conn, ~p"/coders/#{coder}")
      assert redirected_to(conn) == ~p"/coders"

      assert_error_sent 404, fn ->
        get(conn, ~p"/coders/#{coder}")
      end
    end
  end

  defp create_coder(_) do
    coder = coder_fixture()
    %{coder: coder}
  end
end
