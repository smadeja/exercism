defmodule Words do
  @split_regex ~r/[\s:!&@$%\^,_]+/

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(@split_regex, trim: true)
    |> Enum.reduce(%{}, fn word, accumulator ->
      accumulator |> Map.update(word, 1, &(&1 + 1))
    end)
  end
end
