# defmodule FoodApiWeb.RecipeControllerTest do
#   use FoodApiWeb.ConnCase

#   alias FoodApi.Food
#   alias FoodApi.Food.Recipe

#   @create_attrs %{
#     calories: "some calories",
#     title: "some title"
#   }
#   @update_attrs %{
#     calories: "some updated calories",
#     title: "some updated title"
#   }
#   @invalid_attrs %{calories: nil, title: nil}

#   def fixture(:recipe) do
#     {:ok, recipe} = Food.create_recipe(@create_attrs)
#     recipe
#   end

#   setup %{conn: conn} do
#     {:ok, conn: put_req_header(conn, "accept", "application/json")}
#   end

#   describe "index" do
#     test "lists all recipes", %{conn: conn} do
#       conn = get(conn, Routes.recipe_path(conn, :index))
#       assert json_response(conn, 200)["data"] == []
#     end
#   end

#   describe "create recipe" do
#     test "renders recipe when data is valid", %{conn: conn} do
#       conn = post(conn, Routes.recipe_path(conn, :create), recipe: @create_attrs)
#       assert %{"id" => id} = json_response(conn, 201)["data"]

#       conn = get(conn, Routes.recipe_path(conn, :show, id))

#       assert %{
#                "id" => id,
#                "calories" => "some calories",
#                "title" => "some title"
#              } = json_response(conn, 200)["data"]
#     end

#     test "renders errors when data is invalid", %{conn: conn} do
#       conn = post(conn, Routes.recipe_path(conn, :create), recipe: @invalid_attrs)
#       assert json_response(conn, 422)["errors"] != %{}
#     end
#   end

#   describe "update recipe" do
#     setup [:create_recipe]

#     test "renders recipe when data is valid", %{conn: conn, recipe: %Recipe{id: id} = recipe} do
#       conn = put(conn, Routes.recipe_path(conn, :update, recipe), recipe: @update_attrs)
#       assert %{"id" => ^id} = json_response(conn, 200)["data"]

#       conn = get(conn, Routes.recipe_path(conn, :show, id))

#       assert %{
#                "id" => id,
#                "calories" => "some updated calories",
#                "title" => "some updated title"
#              } = json_response(conn, 200)["data"]
#     end

#     test "renders errors when data is invalid", %{conn: conn, recipe: recipe} do
#       conn = put(conn, Routes.recipe_path(conn, :update, recipe), recipe: @invalid_attrs)
#       assert json_response(conn, 422)["errors"] != %{}
#     end
#   end

#   describe "delete recipe" do
#     setup [:create_recipe]

#     test "deletes chosen recipe", %{conn: conn, recipe: recipe} do
#       conn = delete(conn, Routes.recipe_path(conn, :delete, recipe))
#       assert response(conn, 204)

#       assert_error_sent 404, fn ->
#         get(conn, Routes.recipe_path(conn, :show, recipe))
#       end
#     end
#   end

#   defp create_recipe(_) do
#     recipe = fixture(:recipe)
#     %{recipe: recipe}
#   end
# end
