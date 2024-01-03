defmodule TsOban.Date do
  @moduledoc """
  The Date context.
  """

  import Ecto.Query, warn: false
  alias TsOban.Repo

  alias TsOban.Date.Dates

  alias Ecto.Changeset

  alias TsOban.DailyRanking.DailyRankings

  alias TsOban.SuperheroDailyStatistic.SuperheroDailyStatistics

  @doc """
  Returns the list of dates.

  ## Examples

      iex> list_dates()
      [%Dates{}, ...]

  """
  def list_dates do
    Repo.all(Dates)
  end


  def get_daily_ranking_by_date_id(date_id), do: Repo.get_by(DailyRankings, date_id: date_id)

  def all_superhero_daily_statistics_for_date(date_id),
  do: Repo.all(from s in SuperheroDailyStatistics, where: s.date_id == ^date_id)

  def change_daily_ranking(%DailyRankings{} = data), do: DailyRankings.changeset(data, %{})
  def change_daily_ranking(attrs), do: DailyRankings.changeset(attrs)
  def change_daily_ranking(data, attrs), do: DailyRankings.changeset(data, attrs)
  def create_daily_ranking(%Changeset{} = changeset), do: Repo.insert(changeset)
  def create_daily_ranking(attrs), do: attrs |> change_daily_ranking() |> create_daily_ranking()
  @doc """
  Gets a single dates.

  Raises `Ecto.NoResultsError` if the Dates does not exist.

  ## Examples

      iex> get_dates!(123)
      %Dates{}

      iex> get_dates!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dates!(id), do: Repo.get!(Dates, id)

  @doc """
  Creates a dates.

  ## Examples

      iex> create_dates(%{field: value})
      {:ok, %Dates{}}

      iex> create_dates(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dates(attrs \\ %{}) do
    %Dates{}
    |> Dates.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dates.

  ## Examples

      iex> update_dates(dates, %{field: new_value})
      {:ok, %Dates{}}

      iex> update_dates(dates, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dates(%Dates{} = dates, attrs) do
    dates
    |> Dates.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a dates.

  ## Examples

      iex> delete_dates(dates)
      {:ok, %Dates{}}

      iex> delete_dates(dates)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dates(%Dates{} = dates) do
    Repo.delete(dates)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dates changes.

  ## Examples

      iex> change_dates(dates)
      %Ecto.Changeset{data: %Dates{}}

  """
  def change_dates(%Dates{} = dates, attrs \\ %{}) do
    Dates.changeset(dates, attrs)
  end
end
