defmodule TsOban.SuperheroDailyStatistic.SuperheroDailyStatistics do
  use Ecto.Schema
  import Ecto.Changeset


  alias TsOban.Date.Dates
  alias TsOban.Superhero.Superheroes

  schema "superhero_daily_statistics" do
    field :people_saved, :integer
    field :crises_averted, :integer
    # field :superhero_id, :id
    # field :date_id, :id
    belongs_to(:superhero, Superheroes)
    belongs_to(:date, Dates)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(superhero_daily_statistics, attrs) do
    superhero_daily_statistics
    |> cast(attrs, [:people_saved, :crises_averted, :date_id,:superhero_id])
    |> validate_required([:people_saved, :crises_averted, :date_id,:superhero_id])
  end
end
