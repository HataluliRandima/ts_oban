defmodule TsOban.SuperheroDailyStatisticFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TsOban.SuperheroDailyStatistic` context.
  """

  @doc """
  Generate a superhero_daily_statistics.
  """
  def superhero_daily_statistics_fixture(attrs \\ %{}) do
    {:ok, superhero_daily_statistics} =
      attrs
      |> Enum.into(%{
        crises_averted: 42,
        people_saved: 42
      })
      |> TsOban.SuperheroDailyStatistic.create_superhero_daily_statistics()

    superhero_daily_statistics
  end
end
