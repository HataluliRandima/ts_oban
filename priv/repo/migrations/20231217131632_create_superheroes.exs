defmodule TsOban.Repo.Migrations.CreateSuperheroes do
  use Ecto.Migration

  def change do
    create table(:superheroes) do
      add :name, :string
      add :power, :string
      add :country, :string

      timestamps(type: :utc_datetime)
    end
  end
end
