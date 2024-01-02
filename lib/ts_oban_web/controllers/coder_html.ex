defmodule TsObanWeb.CoderHTML do
  use TsObanWeb, :html

  embed_templates "coder_html/*"

  @doc """
  Renders a coder form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def coder_form(assigns)
end
