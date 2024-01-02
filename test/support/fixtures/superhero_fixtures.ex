defmodule TsOban.SuperheroFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TsOban.Superhero` context.
  """

  @doc """
  Generate a superheroes.
  """
  def superheroes_fixture(attrs \\ %{}) do
    {:ok, superheroes} =
      attrs
      |> Enum.into(%{
        country: "some country",
        name: "some name",
        power: "some power"
      })
      |> TsOban.Superhero.create_superheroes()

    superheroes
  end
end
