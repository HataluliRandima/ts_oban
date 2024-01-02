defmodule TsObanWeb.SuperheroDailyStatisticsControllerTest do
  use TsObanWeb.ConnCase

  import TsOban.SuperheroDailyStatisticFixtures

  @create_attrs %{people_saved: 42, crises_averted: 42}
  @update_attrs %{people_saved: 43, crises_averted: 43}
  @invalid_attrs %{people_saved: nil, crises_averted: nil}

  describe "index" do
    test "lists all superhero_daily_statistics", %{conn: conn} do
      conn = get(conn, ~p"/superhero_daily_statistics")
      assert html_response(conn, 200) =~ "Listing Superhero daily statistics"
    end
  end

  describe "new superhero_daily_statistics" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/superhero_daily_statistics/new")
      assert html_response(conn, 200) =~ "New Superhero daily statistics"
    end
  end

  describe "create superhero_daily_statistics" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/superhero_daily_statistics", superhero_daily_statistics: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/superhero_daily_statistics/#{id}"

      conn = get(conn, ~p"/superhero_daily_statistics/#{id}")
      assert html_response(conn, 200) =~ "Superhero daily statistics #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/superhero_daily_statistics", superhero_daily_statistics: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Superhero daily statistics"
    end
  end

  describe "edit superhero_daily_statistics" do
    setup [:create_superhero_daily_statistics]

    test "renders form for editing chosen superhero_daily_statistics", %{conn: conn, superhero_daily_statistics: superhero_daily_statistics} do
      conn = get(conn, ~p"/superhero_daily_statistics/#{superhero_daily_statistics}/edit")
      assert html_response(conn, 200) =~ "Edit Superhero daily statistics"
    end
  end

  describe "update superhero_daily_statistics" do
    setup [:create_superhero_daily_statistics]

    test "redirects when data is valid", %{conn: conn, superhero_daily_statistics: superhero_daily_statistics} do
      conn = put(conn, ~p"/superhero_daily_statistics/#{superhero_daily_statistics}", superhero_daily_statistics: @update_attrs)
      assert redirected_to(conn) == ~p"/superhero_daily_statistics/#{superhero_daily_statistics}"

      conn = get(conn, ~p"/superhero_daily_statistics/#{superhero_daily_statistics}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, superhero_daily_statistics: superhero_daily_statistics} do
      conn = put(conn, ~p"/superhero_daily_statistics/#{superhero_daily_statistics}", superhero_daily_statistics: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Superhero daily statistics"
    end
  end

  describe "delete superhero_daily_statistics" do
    setup [:create_superhero_daily_statistics]

    test "deletes chosen superhero_daily_statistics", %{conn: conn, superhero_daily_statistics: superhero_daily_statistics} do
      conn = delete(conn, ~p"/superhero_daily_statistics/#{superhero_daily_statistics}")
      assert redirected_to(conn) == ~p"/superhero_daily_statistics"

      assert_error_sent 404, fn ->
        get(conn, ~p"/superhero_daily_statistics/#{superhero_daily_statistics}")
      end
    end
  end

  defp create_superhero_daily_statistics(_) do
    superhero_daily_statistics = superhero_daily_statistics_fixture()
    %{superhero_daily_statistics: superhero_daily_statistics}
  end
end
