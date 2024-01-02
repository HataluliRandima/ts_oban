defmodule TsOban.DateFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TsOban.Date` context.
  """

  @doc """
  Generate a unique dates date.
  """
  def unique_dates_date do
    raise "implement the logic to generate a unique dates date"
  end

  @doc """
  Generate a dates.
  """
  def dates_fixture(attrs \\ %{}) do
    {:ok, dates} =
      attrs
      |> Enum.into(%{
        date: unique_dates_date()
      })
      |> TsOban.Date.create_dates()

    dates
  end
end
