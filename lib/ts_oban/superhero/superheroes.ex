defmodule TsOban.Superhero.Superheroes do
  use Ecto.Schema
  import Ecto.Changeset

  alias TsOban.SuperheroDailyStatistic.SuperheroDailyStatistics

  schema "superheroes" do
    field :name, :string
    field :power, :string
    field :country, :string

    has_many(:superhero_daily_statistics, SuperheroDailyStatistics)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(superheroes, attrs) do
    superheroes
    |> cast(attrs, [:name, :power, :country])
    |> validate_required([:name, :power, :country])
  end
end
