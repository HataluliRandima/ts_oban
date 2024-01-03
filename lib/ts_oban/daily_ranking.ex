defmodule TsOban.DailyRanking do
  @moduledoc """
  The DailyRanking context.
  """

  import Ecto.Query, warn: false
  alias TsOban.Repo

  alias Ecto.Changeset

  alias TsOban.DailyRanking.DailyRankings

  @doc """
  Returns the list of daily_rankings.

  ## Examples

      iex> list_daily_rankings()
      [%DailyRankings{}, ...]

  """
  def list_daily_rankings do
    Repo.all(DailyRankings)
  end

  @doc """
  Gets a single daily_rankings.

  Raises `Ecto.NoResultsError` if the Daily rankings does not exist.

  ## Examples

      iex> get_daily_rankings!(123)
      %DailyRankings{}

      iex> get_daily_rankings!(456)
      ** (Ecto.NoResultsError)

  """
  def get_daily_rankings!(id), do: Repo.get!(DailyRankings, id)

  @doc """
  Creates a daily_rankings.

  ## Examples

      iex> create_daily_rankings(%{field: value})
      {:ok, %DailyRankings{}}

      iex> create_daily_rankings(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_daily_rankings(attrs \\ %{}) do
    %DailyRankings{}
    |> DailyRankings.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a daily_rankings.

  ## Examples

      iex> update_daily_rankings(daily_rankings, %{field: new_value})
      {:ok, %DailyRankings{}}

      iex> update_daily_rankings(daily_rankings, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_daily_rankings(%DailyRankings{} = daily_rankings, attrs) do
    daily_rankings
    |> DailyRankings.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a daily_rankings.

  ## Examples

      iex> delete_daily_rankings(daily_rankings)
      {:ok, %DailyRankings{}}

      iex> delete_daily_rankings(daily_rankings)
      {:error, %Ecto.Changeset{}}

  """
  def delete_daily_rankings(%DailyRankings{} = daily_rankings) do
    Repo.delete(daily_rankings)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking daily_rankings changes.

  ## Examples

      iex> change_daily_rankings(daily_rankings)
      %Ecto.Changeset{data: %DailyRankings{}}

  """
  def change_daily_rankings(%DailyRankings{} = daily_rankings, attrs \\ %{}) do
    DailyRankings.changeset(daily_rankings, attrs)
  end
end
