defmodule TsOban.DailyRankingTest do
  use TsOban.DataCase

  alias TsOban.DailyRanking

  describe "daily_rankings" do
    alias TsOban.DailyRanking.DailyRankings

    import TsOban.DailyRankingFixtures

    @invalid_attrs %{ranked_superhero_ids: nil}

    test "list_daily_rankings/0 returns all daily_rankings" do
      daily_rankings = daily_rankings_fixture()
      assert DailyRanking.list_daily_rankings() == [daily_rankings]
    end

    test "get_daily_rankings!/1 returns the daily_rankings with given id" do
      daily_rankings = daily_rankings_fixture()
      assert DailyRanking.get_daily_rankings!(daily_rankings.id) == daily_rankings
    end

    test "create_daily_rankings/1 with valid data creates a daily_rankings" do
      valid_attrs = %{ranked_superhero_ids: [1, 2]}

      assert {:ok, %DailyRankings{} = daily_rankings} = DailyRanking.create_daily_rankings(valid_attrs)
      assert daily_rankings.ranked_superhero_ids == [1, 2]
    end

    test "create_daily_rankings/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DailyRanking.create_daily_rankings(@invalid_attrs)
    end

    test "update_daily_rankings/2 with valid data updates the daily_rankings" do
      daily_rankings = daily_rankings_fixture()
      update_attrs = %{ranked_superhero_ids: [1]}

      assert {:ok, %DailyRankings{} = daily_rankings} = DailyRanking.update_daily_rankings(daily_rankings, update_attrs)
      assert daily_rankings.ranked_superhero_ids == [1]
    end

    test "update_daily_rankings/2 with invalid data returns error changeset" do
      daily_rankings = daily_rankings_fixture()
      assert {:error, %Ecto.Changeset{}} = DailyRanking.update_daily_rankings(daily_rankings, @invalid_attrs)
      assert daily_rankings == DailyRanking.get_daily_rankings!(daily_rankings.id)
    end

    test "delete_daily_rankings/1 deletes the daily_rankings" do
      daily_rankings = daily_rankings_fixture()
      assert {:ok, %DailyRankings{}} = DailyRanking.delete_daily_rankings(daily_rankings)
      assert_raise Ecto.NoResultsError, fn -> DailyRanking.get_daily_rankings!(daily_rankings.id) end
    end

    test "change_daily_rankings/1 returns a daily_rankings changeset" do
      daily_rankings = daily_rankings_fixture()
      assert %Ecto.Changeset{} = DailyRanking.change_daily_rankings(daily_rankings)
    end
  end
end
