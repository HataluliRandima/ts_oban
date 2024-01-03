defmodule TsObanWeb.DailyRankingsController do
  use TsObanWeb, :controller

  alias TsOban.DailyRanking
  alias TsOban.DailyRanking.DailyRankings

  def index(conn, _params) do
    daily_rankings = DailyRanking.list_daily_rankings()
    render(conn, :index, daily_rankings_collection: daily_rankings)
  end

  def new(conn, _params) do
    changeset = DailyRanking.change_daily_rankings(%DailyRankings{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"daily_rankings" => daily_rankings_params}) do
    case DailyRanking.create_daily_rankings(daily_rankings_params) do
      {:ok, daily_rankings} ->
        conn
        |> put_flash(:info, "Daily rankings created successfully.")
        |> redirect(to: ~p"/daily_rankings/#{daily_rankings}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    daily_rankings = DailyRanking.get_daily_rankings!(id)
    render(conn, :show, daily_rankings: daily_rankings)
  end

  def edit(conn, %{"id" => id}) do
    daily_rankings = DailyRanking.get_daily_rankings!(id)
    changeset = DailyRanking.change_daily_rankings(daily_rankings)
    render(conn, :edit, daily_rankings: daily_rankings, changeset: changeset)
  end

  def update(conn, %{"id" => id, "daily_rankings" => daily_rankings_params}) do
    daily_rankings = DailyRanking.get_daily_rankings!(id)

    case DailyRanking.update_daily_rankings(daily_rankings, daily_rankings_params) do
      {:ok, daily_rankings} ->
        conn
        |> put_flash(:info, "Daily rankings updated successfully.")
        |> redirect(to: ~p"/daily_rankings/#{daily_rankings}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, daily_rankings: daily_rankings, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    daily_rankings = DailyRanking.get_daily_rankings!(id)
    {:ok, _daily_rankings} = DailyRanking.delete_daily_rankings(daily_rankings)

    conn
    |> put_flash(:info, "Daily rankings deleted successfully.")
    |> redirect(to: ~p"/daily_rankings")
  end
end
