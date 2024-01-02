defmodule TsOban.SuperheroDailyStatistic do
  @moduledoc """
  The SuperheroDailyStatistic context.
  """

  import Ecto.Query, warn: false
  alias TsOban.Repo

  alias TsOban.SuperheroDailyStatistic.SuperheroDailyStatistics

  @doc """
  Returns the list of superhero_daily_statistics.

  ## Examples

      iex> list_superhero_daily_statistics()
      [%SuperheroDailyStatistics{}, ...]

  """
  def list_superhero_daily_statistics do
    Repo.all(SuperheroDailyStatistics)
  end

  @doc """
  Gets a single superhero_daily_statistics.

  Raises `Ecto.NoResultsError` if the Superhero daily statistics does not exist.

  ## Examples

      iex> get_superhero_daily_statistics!(123)
      %SuperheroDailyStatistics{}

      iex> get_superhero_daily_statistics!(456)
      ** (Ecto.NoResultsError)

  """
  def get_superhero_daily_statistics!(id), do: Repo.get!(SuperheroDailyStatistics, id)

  @doc """
  Creates a superhero_daily_statistics.

  ## Examples

      iex> create_superhero_daily_statistics(%{field: value})
      {:ok, %SuperheroDailyStatistics{}}

      iex> create_superhero_daily_statistics(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_superhero_daily_statistics(attrs \\ %{}) do
    %SuperheroDailyStatistics{}
    |> SuperheroDailyStatistics.changeset(attrs)
    |> Repo.insert()
  end

  def create_superhero_daily_statisticsb(attrs \\ %{}) do
    %SuperheroDailyStatistics{}
    |> SuperheroDailyStatistics.changeset(attrs)
    |> Repo.insert_all()
  end

  @doc """
  Updates a superhero_daily_statistics.

  ## Examples

      iex> update_superhero_daily_statistics(superhero_daily_statistics, %{field: new_value})
      {:ok, %SuperheroDailyStatistics{}}

      iex> update_superhero_daily_statistics(superhero_daily_statistics, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_superhero_daily_statistics(%SuperheroDailyStatistics{} = superhero_daily_statistics, attrs) do
    superhero_daily_statistics
    |> SuperheroDailyStatistics.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a superhero_daily_statistics.

  ## Examples

      iex> delete_superhero_daily_statistics(superhero_daily_statistics)
      {:ok, %SuperheroDailyStatistics{}}

      iex> delete_superhero_daily_statistics(superhero_daily_statistics)
      {:error, %Ecto.Changeset{}}

  """
  def delete_superhero_daily_statistics(%SuperheroDailyStatistics{} = superhero_daily_statistics) do
    Repo.delete(superhero_daily_statistics)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking superhero_daily_statistics changes.

  ## Examples

      iex> change_superhero_daily_statistics(superhero_daily_statistics)
      %Ecto.Changeset{data: %SuperheroDailyStatistics{}}

  """
  def change_superhero_daily_statistics(%SuperheroDailyStatistics{} = superhero_daily_statistics, attrs \\ %{}) do
    SuperheroDailyStatistics.changeset(superhero_daily_statistics, attrs)
  end
end
