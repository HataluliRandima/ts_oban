defmodule TsObanWeb.DailyRankingsControllerTest do
  use TsObanWeb.ConnCase

  import TsOban.DailyRankingFixtures

  @create_attrs %{ranked_superhero_ids: [1, 2]}
  @update_attrs %{ranked_superhero_ids: [1]}
  @invalid_attrs %{ranked_superhero_ids: nil}

  describe "index" do
    test "lists all daily_rankings", %{conn: conn} do
      conn = get(conn, ~p"/daily_rankings")
      assert html_response(conn, 200) =~ "Listing Daily rankings"
    end
  end

  describe "new daily_rankings" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/daily_rankings/new")
      assert html_response(conn, 200) =~ "New Daily rankings"
    end
  end

  describe "create daily_rankings" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/daily_rankings", daily_rankings: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/daily_rankings/#{id}"

      conn = get(conn, ~p"/daily_rankings/#{id}")
      assert html_response(conn, 200) =~ "Daily rankings #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/daily_rankings", daily_rankings: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Daily rankings"
    end
  end

  describe "edit daily_rankings" do
    setup [:create_daily_rankings]

    test "renders form for editing chosen daily_rankings", %{conn: conn, daily_rankings: daily_rankings} do
      conn = get(conn, ~p"/daily_rankings/#{daily_rankings}/edit")
      assert html_response(conn, 200) =~ "Edit Daily rankings"
    end
  end

  describe "update daily_rankings" do
    setup [:create_daily_rankings]

    test "redirects when data is valid", %{conn: conn, daily_rankings: daily_rankings} do
      conn = put(conn, ~p"/daily_rankings/#{daily_rankings}", daily_rankings: @update_attrs)
      assert redirected_to(conn) == ~p"/daily_rankings/#{daily_rankings}"

      conn = get(conn, ~p"/daily_rankings/#{daily_rankings}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, daily_rankings: daily_rankings} do
      conn = put(conn, ~p"/daily_rankings/#{daily_rankings}", daily_rankings: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Daily rankings"
    end
  end

  describe "delete daily_rankings" do
    setup [:create_daily_rankings]

    test "deletes chosen daily_rankings", %{conn: conn, daily_rankings: daily_rankings} do
      conn = delete(conn, ~p"/daily_rankings/#{daily_rankings}")
      assert redirected_to(conn) == ~p"/daily_rankings"

      assert_error_sent 404, fn ->
        get(conn, ~p"/daily_rankings/#{daily_rankings}")
      end
    end
  end

  defp create_daily_rankings(_) do
    daily_rankings = daily_rankings_fixture()
    %{daily_rankings: daily_rankings}
  end
end
