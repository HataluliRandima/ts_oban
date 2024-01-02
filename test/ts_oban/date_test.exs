defmodule TsOban.DateTest do
  use TsOban.DataCase

  alias TsOban.Date

  describe "dates" do
    alias TsOban.Date.Dates

    import TsOban.DateFixtures

    @invalid_attrs %{date: nil}

    test "list_dates/0 returns all dates" do
      dates = dates_fixture()
      assert Date.list_dates() == [dates]
    end

    test "get_dates!/1 returns the dates with given id" do
      dates = dates_fixture()
      assert Date.get_dates!(dates.id) == dates
    end

    test "create_dates/1 with valid data creates a dates" do
      valid_attrs = %{date: ~D[2023-12-16]}

      assert {:ok, %Dates{} = dates} = Date.create_dates(valid_attrs)
      assert dates.date == ~D[2023-12-16]
    end

    test "create_dates/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Date.create_dates(@invalid_attrs)
    end

    test "update_dates/2 with valid data updates the dates" do
      dates = dates_fixture()
      update_attrs = %{date: ~D[2023-12-17]}

      assert {:ok, %Dates{} = dates} = Date.update_dates(dates, update_attrs)
      assert dates.date == ~D[2023-12-17]
    end

    test "update_dates/2 with invalid data returns error changeset" do
      dates = dates_fixture()
      assert {:error, %Ecto.Changeset{}} = Date.update_dates(dates, @invalid_attrs)
      assert dates == Date.get_dates!(dates.id)
    end

    test "delete_dates/1 deletes the dates" do
      dates = dates_fixture()
      assert {:ok, %Dates{}} = Date.delete_dates(dates)
      assert_raise Ecto.NoResultsError, fn -> Date.get_dates!(dates.id) end
    end

    test "change_dates/1 returns a dates changeset" do
      dates = dates_fixture()
      assert %Ecto.Changeset{} = Date.change_dates(dates)
    end
  end
end
