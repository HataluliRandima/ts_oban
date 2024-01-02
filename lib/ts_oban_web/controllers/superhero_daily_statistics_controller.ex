defmodule TsObanWeb.SuperheroDailyStatisticsController do
  use TsObanWeb, :controller

  alias TsOban.SuperheroDailyStatistic
  alias TsOban.SuperheroDailyStatistic.SuperheroDailyStatistics

  def index(conn, _params) do
    superhero_daily_statistics = SuperheroDailyStatistic.list_superhero_daily_statistics()
    render(conn, :index, superhero_daily_statistics_collection: superhero_daily_statistics)
  end

  def new(conn, _params) do
    changeset = SuperheroDailyStatistic.change_superhero_daily_statistics(%SuperheroDailyStatistics{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"superhero_daily_statistics" => superhero_daily_statistics_params}) do
    case SuperheroDailyStatistic.create_superhero_daily_statistics(superhero_daily_statistics_params) do
      {:ok, superhero_daily_statistics} ->
        conn
        |> put_flash(:info, "Superhero daily statistics created successfully.")
        |> redirect(to: ~p"/superhero_daily_statistics/#{superhero_daily_statistics}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    superhero_daily_statistics = SuperheroDailyStatistic.get_superhero_daily_statistics!(id)
    render(conn, :show, superhero_daily_statistics: superhero_daily_statistics)
  end

  def edit(conn, %{"id" => id}) do
    superhero_daily_statistics = SuperheroDailyStatistic.get_superhero_daily_statistics!(id)
    changeset = SuperheroDailyStatistic.change_superhero_daily_statistics(superhero_daily_statistics)
    render(conn, :edit, superhero_daily_statistics: superhero_daily_statistics, changeset: changeset)
  end

  def update(conn, %{"id" => id, "superhero_daily_statistics" => superhero_daily_statistics_params}) do
    superhero_daily_statistics = SuperheroDailyStatistic.get_superhero_daily_statistics!(id)

    case SuperheroDailyStatistic.update_superhero_daily_statistics(superhero_daily_statistics, superhero_daily_statistics_params) do
      {:ok, superhero_daily_statistics} ->
        conn
        |> put_flash(:info, "Superhero daily statistics updated successfully.")
        |> redirect(to: ~p"/superhero_daily_statistics/#{superhero_daily_statistics}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, superhero_daily_statistics: superhero_daily_statistics, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    superhero_daily_statistics = SuperheroDailyStatistic.get_superhero_daily_statistics!(id)
    {:ok, _superhero_daily_statistics} = SuperheroDailyStatistic.delete_superhero_daily_statistics(superhero_daily_statistics)

    conn
    |> put_flash(:info, "Superhero daily statistics deleted successfully.")
    |> redirect(to: ~p"/superhero_daily_statistics")
  end
end
