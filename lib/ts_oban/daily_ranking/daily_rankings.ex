defmodule TsOban.DailyRanking.DailyRankings do
  use Ecto.Schema
  import Ecto.Changeset

  alias TsOban.Date.Dates

  schema "daily_rankings" do
    field :ranked_superhero_ids, {:array, :integer}
    #field :date_id, :id
    belongs_to(:date, Dates)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(daily_rankings, attrs) do
    daily_rankings
    |> cast(attrs, [:ranked_superhero_ids, :date_id])
    |> validate_required([:ranked_superhero_ids, :date_id])
  end
end
