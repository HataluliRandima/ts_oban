defmodule TsOban.Repo.Migrations.CreateCoders do
  use Ecto.Migration

  def change do
    create table(:coders) do
      add :name, :string
      add :email, :string
      add :position, :string

      timestamps(type: :utc_datetime)
    end
  end
end
