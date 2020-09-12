defmodule FoodApi.Food.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Poison.Encoder, only: [:id, :userId, :title, :completed]}
  embedded_schema do
    field :userId, :string
    field :title, :string
    field :completed, :boolean
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:title, :completed])
    |> validate_required([:title, :completed])
  end

end
