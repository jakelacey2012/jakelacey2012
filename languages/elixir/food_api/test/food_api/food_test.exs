defmodule FoodApi.FoodTest do
  use FoodApi.DataCase

  alias FoodApi.Food

  describe "recipes" do
    alias FoodApi.Food.Recipe

    @valid_attrs %{calories: "some calories", title: "some title"}
    @update_attrs %{calories: "some updated calories", title: "some updated title"}
    @invalid_attrs %{calories: nil, title: nil}

    def recipe_fixture(attrs \\ %{}) do
      {:ok, recipe} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Food.create_recipe()

      recipe
    end

    test "list_recipes/0 returns all recipes" do
      recipe = recipe_fixture()
      assert Food.list_recipes() == [recipe]
    end

    test "get_recipe!/1 returns the recipe with given id" do
      recipe = recipe_fixture()
      assert Food.get_recipe!(recipe.id) == recipe
    end

    test "create_recipe/1 with valid data creates a recipe" do
      assert {:ok, %Recipe{} = recipe} = Food.create_recipe(@valid_attrs)
      assert recipe.calories == "some calories"
      assert recipe.title == "some title"
    end

    test "create_recipe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Food.create_recipe(@invalid_attrs)
    end

    test "update_recipe/2 with valid data updates the recipe" do
      recipe = recipe_fixture()
      assert {:ok, %Recipe{} = recipe} = Food.update_recipe(recipe, @update_attrs)
      assert recipe.calories == "some updated calories"
      assert recipe.title == "some updated title"
    end

    test "update_recipe/2 with invalid data returns error changeset" do
      recipe = recipe_fixture()
      assert {:error, %Ecto.Changeset{}} = Food.update_recipe(recipe, @invalid_attrs)
      assert recipe == Food.get_recipe!(recipe.id)
    end

    test "delete_recipe/1 deletes the recipe" do
      recipe = recipe_fixture()
      assert {:ok, %Recipe{}} = Food.delete_recipe(recipe)
      assert_raise Ecto.NoResultsError, fn -> Food.get_recipe!(recipe.id) end
    end

    test "change_recipe/1 returns a recipe changeset" do
      recipe = recipe_fixture()
      assert %Ecto.Changeset{} = Food.change_recipe(recipe)
    end
  end
end
