defmodule FoodApi.Todo do

  alias FoodApi.Food.Todo

  @service Application.get_env(:food_api, :service)

  def fetch() do
    case @service.todo() do
      {:ok, %Todo{} = to} -> to
      {:error, reason} -> reason
    end
  end

end
