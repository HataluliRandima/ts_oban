defmodule TsObanWeb.DatesController do
  use TsObanWeb, :controller

  alias TsOban.Date
  alias TsOban.Date.Dates

  def index(conn, _params) do
    dates = Date.list_dates()
    render(conn, :index, dates_collection: dates)
  end

  def new(conn, _params) do
    changeset = Date.change_dates(%Dates{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"dates" => dates_params}) do
    case Date.create_dates(dates_params) do
      {:ok, dates} ->
        conn
        |> put_flash(:info, "Dates created successfully.")
        |> redirect(to: ~p"/dates/#{dates}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    dates = Date.get_dates!(id)
    render(conn, :show, dates: dates)
  end

  def edit(conn, %{"id" => id}) do
    dates = Date.get_dates!(id)
    changeset = Date.change_dates(dates)
    render(conn, :edit, dates: dates, changeset: changeset)
  end

  def update(conn, %{"id" => id, "dates" => dates_params}) do
    dates = Date.get_dates!(id)

    case Date.update_dates(dates, dates_params) do
      {:ok, dates} ->
        conn
        |> put_flash(:info, "Dates updated successfully.")
        |> redirect(to: ~p"/dates/#{dates}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, dates: dates, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dates = Date.get_dates!(id)
    {:ok, _dates} = Date.delete_dates(dates)

    conn
    |> put_flash(:info, "Dates deleted successfully.")
    |> redirect(to: ~p"/dates")
  end
end
