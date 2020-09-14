defmodule FoodApi.Service do

  def fetch(id) do
    case HTTPoison.get("http://busqit.com") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  @doc """
  Fetches thing

  ## Examples

      iex> todo()
      {:ok, %Todo{}}

      iex> todo()
      {:error, "reason"}

  """
  def todo() do
    case HTTPoison.get("https://jsonplaceholder.typicode.com/todos/1") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        item = Poison.decode!(body, as: %FoodApi.Food.Todo{})
        # IO.puts("hello")
        # IO.puts(item.title)
        # IO.puts(struct(FoodApi.Food.Todo, item))
        # IO.puts(item)
        {:ok, item}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

end


defmodule FoodApi.MockService do
  def todo() do
    {:ok, %FoodApi.Food.Todo{
      title: "thing",
      completed: false,
    }}
  end
end
