defmodule TsObanWeb.SuperheroDailyStatisticsHTML do
  use TsObanWeb, :html

  embed_templates "superhero_daily_statistics_html/*"

  @doc """
  Renders a superhero_daily_statistics form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def superhero_daily_statistics_form(assigns)
end
