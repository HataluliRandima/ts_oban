defmodule TsObanWeb.SuperheroesControllerTest do
  use TsObanWeb.ConnCase

  import TsOban.SuperheroFixtures

  @create_attrs %{name: "some name", power: "some power", country: "some country"}
  @update_attrs %{name: "some updated name", power: "some updated power", country: "some updated country"}
  @invalid_attrs %{name: nil, power: nil, country: nil}

  describe "index" do
    test "lists all superheroes", %{conn: conn} do
      conn = get(conn, ~p"/superheroes")
      assert html_response(conn, 200) =~ "Listing Superheroes"
    end
  end

  describe "new superheroes" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/superheroes/new")
      assert html_response(conn, 200) =~ "New Superheroes"
    end
  end

  describe "create superheroes" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/superheroes", superheroes: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/superheroes/#{id}"

      conn = get(conn, ~p"/superheroes/#{id}")
      assert html_response(conn, 200) =~ "Superheroes #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/superheroes", superheroes: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Superheroes"
    end
  end

  describe "edit superheroes" do
    setup [:create_superheroes]

    test "renders form for editing chosen superheroes", %{conn: conn, superheroes: superheroes} do
      conn = get(conn, ~p"/superheroes/#{superheroes}/edit")
      assert html_response(conn, 200) =~ "Edit Superheroes"
    end
  end

  describe "update superheroes" do
    setup [:create_superheroes]

    test "redirects when data is valid", %{conn: conn, superheroes: superheroes} do
      conn = put(conn, ~p"/superheroes/#{superheroes}", superheroes: @update_attrs)
      assert redirected_to(conn) == ~p"/superheroes/#{superheroes}"

      conn = get(conn, ~p"/superheroes/#{superheroes}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, superheroes: superheroes} do
      conn = put(conn, ~p"/superheroes/#{superheroes}", superheroes: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Superheroes"
    end
  end

  describe "delete superheroes" do
    setup [:create_superheroes]

    test "deletes chosen superheroes", %{conn: conn, superheroes: superheroes} do
      conn = delete(conn, ~p"/superheroes/#{superheroes}")
      assert redirected_to(conn) == ~p"/superheroes"

      assert_error_sent 404, fn ->
        get(conn, ~p"/superheroes/#{superheroes}")
      end
    end
  end

  defp create_superheroes(_) do
    superheroes = superheroes_fixture()
    %{superheroes: superheroes}
  end
end
