defmodule ASD do
  @moduledoc """
  Documentation for `ASD`.
  """

  def main(argv) do
    {options, command, _} = OptionParser.parse(argv,
      switches: [url: :string],
      aliases: [u: :url]
    )

    ASD.call(command, options)
  end

  def call(["hello"], _options) do
    IO.puts("hello to you too!")
  end

  def call(["ping"], options) do
    url = options[:url]
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200}} ->
        IO.puts "200"
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, _} ->
        IO.puts "Error"
    end
  end

  def call(_, _) do
    IO.puts("invalid arguments")
  end
end
