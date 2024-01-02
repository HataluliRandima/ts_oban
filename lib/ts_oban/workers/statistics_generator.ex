defmodule TsOban.StatisticsGenerator do
  @moduledoc false
  use Oban.Worker, queue: :default
  #alias ObanExample.{DailyRankingProcessor, Feats}

  #alias TsOban.DailyRankingProcessor
  alias TsOban.Superhero

  alias TsOban.SuperheroDailyStatistic.SuperheroDailyStatistics

  import Ecto.Query, warn: false
  alias TsOban.Repo

  @impl Oban.Worker

  def perform(%Oban.Job{args: %{"date" => date}}) do
    parsed = Date.from_iso8601!(date)
    do_for_date(parsed)
  end

  def perform(%Oban.Job{}) do
    do_for_date(Date.utc_today())
  end


  def insert_hero_statistics(data) do
    data
    |> Enum.map(&prepare_hero_statistic_changeset(&1))
    |> Repo.insert_all(SuperheroDailyStatistics)
  end

  defp prepare_hero_statistic_changeset(attrs) do
    SuperheroDailyStatistics.changeset(%SuperheroDailyStatistics{}, attrs)
  end

  # def create_superhero_daily_statistics(attrs \\ %{}) do
  #   %SuperheroDailyStatistics{}
  #   |> SuperheroDailyStatistics.changeset(attrs)
  #   |> Repo.insert()
  # end


  defp do_for_date(date) do
    created = IO.inspect(get_or_create_date(date))
    superheros = IO.inspect(Superhero.all_superheroes())
    statistics = IO.inspect(Enum.map(superheros, &build_statistics(&1, created)))

    try do
      IO.puts("HATALULIHATALULIHATALULI")
      IO.inspect("Musanda")
      # bd = Enum.reduce(statistics, %{}, &Map.merge/2)
      # IO.inspect(bd)
      # lk = Enum.map(statistics, &(&1))
      # IO.inspect(lk)
     IO.inspect(Superhero.bulk_create_superhero_daily_statistics(statistics))
     IO.inspect(insert_hero_statistics(statistics))
    # IO.inspect(TsOban.SuperheroDailyStatistic.create_superhero_daily_statisticsb(statistics))
      %{date_id: created.id} |> TsOban.DailyRankingProcessor.new() |> Oban.insert()
      IO.puts("HATALULIHATALULIHATALULI")
      {:ok, statistics}
    rescue
      Postgrex.Error ->
        {:cancel, "statistics already found for this superhero for this day"}
    end
  end

  defp get_or_create_date(date) do
    #TsOban.Date.
    with nil <- Superhero.get_date_by_date(date),
         {:ok, created} <- TsOban.Date.create_dates(%{date: date}) do
      created
    else
      {:error, _changeset} -> raise "Couldn't create date"
      found -> found
    end
  end

  defp build_statistics(superhero, date) do
    %{
      superhero_id: superhero.id,
      date_id: date.id,
      people_saved: trunc(:rand.uniform() * 100),
      crises_averted: trunc(:rand.uniform() * 3)
    }
  end
end
