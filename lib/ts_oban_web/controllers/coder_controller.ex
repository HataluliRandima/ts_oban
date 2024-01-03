defmodule TsObanWeb.CoderController do
  use TsObanWeb, :controller

  alias TsOban.Coders
  alias TsOban.Coders.Coder

  def index(conn, _params) do
    coders = Coders.list_coders()
    render(conn, :index, coders: coders)
  end

  def new(conn, _params) do
    changeset = Coders.change_coder(%Coder{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"coder" => coder_params}) do
    case Coders.create_coder(coder_params) do
      {:ok, coder} ->
        conn
        |> put_flash(:info, "Coder created successfully.")
        |> redirect(to: ~p"/coders/#{coder}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    coder = Coders.get_coder!(id)
    render(conn, :show, coder: coder)
  end

  def edit(conn, %{"id" => id}) do
    coder = Coders.get_coder!(id)
    changeset = Coders.change_coder(coder)
    render(conn, :edit, coder: coder, changeset: changeset)
  end

  def update(conn, %{"id" => id, "coder" => coder_params}) do
    coder = Coders.get_coder!(id)

    case Coders.update_coder(coder, coder_params) do
      {:ok, coder} ->
        conn
        |> put_flash(:info, "Coder updated successfully.")
        |> redirect(to: ~p"/coders/#{coder}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, coder: coder, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    coder = Coders.get_coder!(id)
    {:ok, _coder} = Coders.delete_coder(coder)

    conn
    |> put_flash(:info, "Coder deleted successfully.")
    |> redirect(to: ~p"/coders")
  end
end
