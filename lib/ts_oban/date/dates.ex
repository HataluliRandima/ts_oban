defmodule TsOban.Date.Dates do
  use Ecto.Schema
  import Ecto.Changeset

  alias TsOban.DailyRanking.DailyRankings
  alias TsOban.SuperheroDailyStatistic.SuperheroDailyStatistics

  schema "dates" do
    field :date, :date

    has_many(:superhero_daily_statistics, SuperheroDailyStatistics)
    has_one(:daily_ranking, DailyRankings)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(dates, attrs) do
    dates
    |> cast(attrs, [:date])
    |> validate_required([:date])
    |> unique_constraint(:date)
  end
end
