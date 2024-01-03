defmodule TsOban.DailyRankingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TsOban.DailyRanking` context.
  """

  @doc """
  Generate a daily_rankings.
  """
  def daily_rankings_fixture(attrs \\ %{}) do
    {:ok, daily_rankings} =
      attrs
      |> Enum.into(%{
        ranked_superhero_ids: [1, 2]
      })
      |> TsOban.DailyRanking.create_daily_rankings()

    daily_rankings
  end
end
