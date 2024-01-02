defmodule TsOban.CodersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TsOban.Coders` context.
  """

  @doc """
  Generate a coder.
  """
  def coder_fixture(attrs \\ %{}) do
    {:ok, coder} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name",
        position: "some position"
      })
      |> TsOban.Coders.create_coder()

    coder
  end
end
