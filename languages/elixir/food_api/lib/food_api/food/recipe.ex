defmodule FoodApi.Food.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :calories, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:title, :calories])
    |> validate_required([:title, :calories])
  end
end
