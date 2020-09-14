defmodule FoodApi.TodoTest do
  # use FoodApi.DataCase

  use ExUnit.Case, async: true

  describe "todos" do
    alias FoodApi.Food.Todo

    @tag :wip
    test "simple" do
      # recipe = recipe_fixture()
      case FoodApi.Todo.fetch() do
        %Todo{} = todo -> assert todo == %Todo{completed: false, id: nil, title: "thing", userId: nil}
      end
    end
  end
end
