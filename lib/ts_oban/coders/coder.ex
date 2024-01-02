defmodule TsOban.Coders.Coder do
  use Ecto.Schema
  import Ecto.Changeset

  schema "coders" do
    field :name, :string
    field :position, :string
    field :email, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(coder, attrs) do
    coder
    |> cast(attrs, [:name, :email, :position])
    |> validate_required([:name, :email, :position])
  end
end
