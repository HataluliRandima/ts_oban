defmodule TsOban.Runnable.Hata do

  def now do
    %{date: "2023-01-03"} |> TsOban.StatisticsGenerator.new() |> Oban.insert()
  end

  def now1 do
    %{} |> TsOban.Workers.DailyEmail.new() |> Oban.insert()
  end
end
