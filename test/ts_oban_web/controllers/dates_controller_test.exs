defmodule TsObanWeb.DatesControllerTest do
  use TsObanWeb.ConnCase

  import TsOban.DateFixtures

  @create_attrs %{date: ~D[2023-12-16]}
  @update_attrs %{date: ~D[2023-12-17]}
  @invalid_attrs %{date: nil}

  describe "index" do
    test "lists all dates", %{conn: conn} do
      conn = get(conn, ~p"/dates")
      assert html_response(conn, 200) =~ "Listing Dates"
    end
  end

  describe "new dates" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/dates/new")
      assert html_response(conn, 200) =~ "New Dates"
    end
  end

  describe "create dates" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/dates", dates: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/dates/#{id}"

      conn = get(conn, ~p"/dates/#{id}")
      assert html_response(conn, 200) =~ "Dates #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/dates", dates: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Dates"
    end
  end

  describe "edit dates" do
    setup [:create_dates]

    test "renders form for editing chosen dates", %{conn: conn, dates: dates} do
      conn = get(conn, ~p"/dates/#{dates}/edit")
      assert html_response(conn, 200) =~ "Edit Dates"
    end
  end

  describe "update dates" do
    setup [:create_dates]

    test "redirects when data is valid", %{conn: conn, dates: dates} do
      conn = put(conn, ~p"/dates/#{dates}", dates: @update_attrs)
      assert redirected_to(conn) == ~p"/dates/#{dates}"

      conn = get(conn, ~p"/dates/#{dates}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, dates: dates} do
      conn = put(conn, ~p"/dates/#{dates}", dates: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Dates"
    end
  end

  describe "delete dates" do
    setup [:create_dates]

    test "deletes chosen dates", %{conn: conn, dates: dates} do
      conn = delete(conn, ~p"/dates/#{dates}")
      assert redirected_to(conn) == ~p"/dates"

      assert_error_sent 404, fn ->
        get(conn, ~p"/dates/#{dates}")
      end
    end
  end

  defp create_dates(_) do
    dates = dates_fixture()
    %{dates: dates}
  end
end
