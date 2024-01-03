defmodule TsOban.Repo.Migrations.CreateSuperheroDailyStatistics do
  use Ecto.Migration

  def change do
    create table(:superhero_daily_statistics) do
      add :people_saved, :integer
      add :crises_averted, :integer
      add :superhero_id, references(:superheroes, on_delete: :nothing)
      add :date_id, references(:dates, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:superhero_daily_statistics, [:superhero_id])
    create index(:superhero_daily_statistics, [:date_id])
  end
end
