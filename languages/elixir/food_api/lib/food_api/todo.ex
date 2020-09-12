defmodule FoodApi.Todo do

  alias FoodApi.Food.Todo

  import FoodApi.Service

  # %Recipe{} = recipe

  def fetch() do
    case todo() do
      {:ok, %Todo{} = to} -> to
      {:error, reason} -> reason
    end
  end

end
