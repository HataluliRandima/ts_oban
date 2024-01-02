defmodule TsObanWeb.SuperheroesController do
  use TsObanWeb, :controller

  alias TsOban.Superhero
  alias TsOban.Superhero.Superheroes

  def index(conn, _params) do
    superheroes = Superhero.list_superheroes()
    render(conn, :index, superheroes_collection: superheroes)
  end

  def new(conn, _params) do
    changeset = Superhero.change_superheroes(%Superheroes{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"superheroes" => superheroes_params}) do
    case Superhero.create_superheroes(superheroes_params) do
      {:ok, superheroes} ->
        conn
        |> put_flash(:info, "Superheroes created successfully.")
        |> redirect(to: ~p"/superheroes/#{superheroes}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    superheroes = Superhero.get_superheroes!(id)
    render(conn, :show, superheroes: superheroes)
  end

  def edit(conn, %{"id" => id}) do
    superheroes = Superhero.get_superheroes!(id)
    changeset = Superhero.change_superheroes(superheroes)
    render(conn, :edit, superheroes: superheroes, changeset: changeset)
  end

  def update(conn, %{"id" => id, "superheroes" => superheroes_params}) do
    superheroes = Superhero.get_superheroes!(id)

    case Superhero.update_superheroes(superheroes, superheroes_params) do
      {:ok, superheroes} ->
        conn
        |> put_flash(:info, "Superheroes updated successfully.")
        |> redirect(to: ~p"/superheroes/#{superheroes}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, superheroes: superheroes, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    superheroes = Superhero.get_superheroes!(id)
    {:ok, _superheroes} = Superhero.delete_superheroes(superheroes)

    conn
    |> put_flash(:info, "Superheroes deleted successfully.")
    |> redirect(to: ~p"/superheroes")
  end
end
