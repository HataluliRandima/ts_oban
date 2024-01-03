defmodule TsOban.SuperheroDailyStatisticTest do
  use TsOban.DataCase

  alias TsOban.SuperheroDailyStatistic

  describe "superhero_daily_statistics" do
    alias TsOban.SuperheroDailyStatistic.SuperheroDailyStatistics

    import TsOban.SuperheroDailyStatisticFixtures

    @invalid_attrs %{people_saved: nil, crises_averted: nil}

    test "list_superhero_daily_statistics/0 returns all superhero_daily_statistics" do
      superhero_daily_statistics = superhero_daily_statistics_fixture()
      assert SuperheroDailyStatistic.list_superhero_daily_statistics() == [superhero_daily_statistics]
    end

    test "get_superhero_daily_statistics!/1 returns the superhero_daily_statistics with given id" do
      superhero_daily_statistics = superhero_daily_statistics_fixture()
      assert SuperheroDailyStatistic.get_superhero_daily_statistics!(superhero_daily_statistics.id) == superhero_daily_statistics
    end

    test "create_superhero_daily_statistics/1 with valid data creates a superhero_daily_statistics" do
      valid_attrs = %{people_saved: 42, crises_averted: 42}

      assert {:ok, %SuperheroDailyStatistics{} = superhero_daily_statistics} = SuperheroDailyStatistic.create_superhero_daily_statistics(valid_attrs)
      assert superhero_daily_statistics.people_saved == 42
      assert superhero_daily_statistics.crises_averted == 42
    end

    test "create_superhero_daily_statistics/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SuperheroDailyStatistic.create_superhero_daily_statistics(@invalid_attrs)
    end

    test "update_superhero_daily_statistics/2 with valid data updates the superhero_daily_statistics" do
      superhero_daily_statistics = superhero_daily_statistics_fixture()
      update_attrs = %{people_saved: 43, crises_averted: 43}

      assert {:ok, %SuperheroDailyStatistics{} = superhero_daily_statistics} = SuperheroDailyStatistic.update_superhero_daily_statistics(superhero_daily_statistics, update_attrs)
      assert superhero_daily_statistics.people_saved == 43
      assert superhero_daily_statistics.crises_averted == 43
    end

    test "update_superhero_daily_statistics/2 with invalid data returns error changeset" do
      superhero_daily_statistics = superhero_daily_statistics_fixture()
      assert {:error, %Ecto.Changeset{}} = SuperheroDailyStatistic.update_superhero_daily_statistics(superhero_daily_statistics, @invalid_attrs)
      assert superhero_daily_statistics == SuperheroDailyStatistic.get_superhero_daily_statistics!(superhero_daily_statistics.id)
    end

    test "delete_superhero_daily_statistics/1 deletes the superhero_daily_statistics" do
      superhero_daily_statistics = superhero_daily_statistics_fixture()
      assert {:ok, %SuperheroDailyStatistics{}} = SuperheroDailyStatistic.delete_superhero_daily_statistics(superhero_daily_statistics)
      assert_raise Ecto.NoResultsError, fn -> SuperheroDailyStatistic.get_superhero_daily_statistics!(superhero_daily_statistics.id) end
    end

    test "change_superhero_daily_statistics/1 returns a superhero_daily_statistics changeset" do
      superhero_daily_statistics = superhero_daily_statistics_fixture()
      assert %Ecto.Changeset{} = SuperheroDailyStatistic.change_superhero_daily_statistics(superhero_daily_statistics)
    end
  end
end
