defmodule TsOban.Superhero do
  @moduledoc """
  The Superhero context.
  """

  import Ecto.Query, warn: false
  alias TsOban.Repo

  alias Ecto.Changeset

  alias TsOban.Superhero.Superheroes
  alias TsOban.SuperheroDailyStatistic.SuperheroDailyStatistics
  alias TsOban.Date.Dates, as: FeatsDate

  @doc """
  Returns the list of superheroes.

  ## Examples

      iex> list_superheroes()
      [%Superheroes{}, ...]

  """
  def list_superheroes do
    Repo.all(Superheroes)
  end

  def all_superheroes, do: Repo.all(Superheroes)

  def change_date(%FeatsDate{} = data), do: FeatsDate.changeset(data, %{})
  def change_date(attrs), do: FeatsDate.changeset(attrs)
  def change_date(data, attrs), do: FeatsDate.changeset(data, attrs)

  def create_todays_date(), do: TsOban.Date.create_dates(%{date: Dates.utc_today()})
  # def create_date(%Changeset{} = changeset), do: Repo.insert(changeset)
  # def create_date(attrs), do: attrs |> change_date() |> create_date()


  def get_todays_date(), do: get_date_by_date(Dates.utc_today())
  def get_date_by_date(date), do: Repo.one(from d in FeatsDate, where: d.date == ^date)

  def bulk_create_superhero_daily_statistics(attrs),
  do: Repo.insert_all(SuperheroDailyStatistics, attrs)

  @doc """
  Gets a single superheroes.

  Raises `Ecto.NoResultsError` if the Superheroes does not exist.

  ## Examples

      iex> get_superheroes!(123)
      %Superheroes{}

      iex> get_superheroes!(456)
      ** (Ecto.NoResultsError)

  """
  def get_superheroes!(id), do: Repo.get!(Superheroes, id)

  @doc """
  Creates a superheroes.

  ## Examples

      iex> create_superheroes(%{field: value})
      {:ok, %Superheroes{}}

      iex> create_superheroes(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_superheroes(attrs \\ %{}) do
    %Superheroes{}
    |> Superheroes.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a superheroes.

  ## Examples

      iex> update_superheroes(superheroes, %{field: new_value})
      {:ok, %Superheroes{}}

      iex> update_superheroes(superheroes, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_superheroes(%Superheroes{} = superheroes, attrs) do
    superheroes
    |> Superheroes.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a superheroes.

  ## Examples

      iex> delete_superheroes(superheroes)
      {:ok, %Superheroes{}}

      iex> delete_superheroes(superheroes)
      {:error, %Ecto.Changeset{}}

  """
  def delete_superheroes(%Superheroes{} = superheroes) do
    Repo.delete(superheroes)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking superheroes changes.

  ## Examples

      iex> change_superheroes(superheroes)
      %Ecto.Changeset{data: %Superheroes{}}

  """
  def change_superheroes(%Superheroes{} = superheroes, attrs \\ %{}) do
    Superheroes.changeset(superheroes, attrs)
  end
end
