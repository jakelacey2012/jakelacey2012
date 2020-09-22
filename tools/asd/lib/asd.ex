defmodule ASD do
  @moduledoc """
  Documentation for `ASD`.
  """

  def main(argv) do
    {options, command, _} = OptionParser.parse(argv,
      switches: [question: :string],
      aliases: [q: :question]
    )

    try do
      ASD.call(command, options)
    rescue
      e in RuntimeError -> e
        IO.puts e.message
    end
  end

  def call(["hello"], _options) do
    IO.puts("hello to you too!")
  end

  def call(_, _) do
    IO.puts("invalid arguments")
  end

end
