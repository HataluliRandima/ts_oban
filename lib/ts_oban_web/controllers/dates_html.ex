defmodule TsObanWeb.DatesHTML do
  use TsObanWeb, :html

  embed_templates "dates_html/*"

  @doc """
  Renders a dates form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def dates_form(assigns)
end
