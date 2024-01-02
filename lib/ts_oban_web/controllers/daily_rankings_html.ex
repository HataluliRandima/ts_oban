defmodule TsObanWeb.DailyRankingsHTML do
  use TsObanWeb, :html

  embed_templates "daily_rankings_html/*"

  @doc """
  Renders a daily_rankings form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def daily_rankings_form(assigns)
end
