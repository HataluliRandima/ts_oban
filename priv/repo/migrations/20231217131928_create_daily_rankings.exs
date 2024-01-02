defmodule TsOban.Repo.Migrations.CreateDailyRankings do
  use Ecto.Migration

  def change do
    create table(:daily_rankings) do
      add :ranked_superhero_ids, {:array, :integer}
      add :date_id, references(:dates, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:daily_rankings, [:date_id])
  end
end
