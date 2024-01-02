defmodule TsOban.DailyRankingProcessor do
  @moduledoc false
  use Oban.Worker, queue: :default
  #alias ObanExample.Feats

  alias TsOban.Date


  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"date_id" => date_id}}) do
    case Date.get_daily_ranking_by_date_id(date_id) do
      nil -> digest(date_id)
      _digest -> {:cancel, "digest already found for this day"}
    end
  end

  defp digest(date_id) do
    stats = Date.all_superhero_daily_statistics_for_date(date_id)

    sorted_ids =
      stats
      |> Enum.sort(fn hero1, hero2 -> hero1.people_saved >= hero2.people_saved end)
      |> Enum.map(fn hero -> hero.superhero_id end)

      IO.inspect("BUBBUA")
 IO.inspect(sorted_ids)
      TsOban.DailyRanking.create_daily_rankings(%{date_id: date_id, ranked_superhero_ids: sorted_ids})
  end
end
