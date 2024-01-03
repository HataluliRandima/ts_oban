defmodule TsOban.Repo.Migrations.CreateDates do
  use Ecto.Migration

  def change do
    create table(:dates) do
      add :date, :date

      timestamps(type: :utc_datetime)
    end

    create unique_index(:dates, [:date])
  end
end
