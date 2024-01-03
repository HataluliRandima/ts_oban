defmodule TsObanWeb.SuperheroesHTML do
  use TsObanWeb, :html

  embed_templates "superheroes_html/*"

  @doc """
  Renders a superheroes form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def superheroes_form(assigns)
end
