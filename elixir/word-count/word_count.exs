defmodule Words do
  @word_regex ~r/(?<word>((?!\_)[\w\-])+)/u

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    do_count(sentence, %{})
  end

  @spec do_count(String.t(), %{optional(String.t()) => integer()}) :: %{
          optional(String.t()) => integer()
        }
  defp do_count(sentence, word_counts) do
    case pop_word(sentence) do
      {matched_word, remaining_sentence} ->
        {_get, updated_word_counts} =
          Map.get_and_update(
            word_counts,
            String.downcase(matched_word),
            fn current_value ->
              case current_value do
                nil -> {current_value, 1}
                _word_count -> {current_value, current_value + 1}
              end
            end
          )

        do_count(remaining_sentence, updated_word_counts)

      _ ->
        word_counts
    end
  end

  @spec pop_word(String.t()) :: {String.t(), String.t()} | nil
  defp pop_word(sentence) do
    case Regex.named_captures(@word_regex, sentence, return: :index) do
      %{"word" => {match_start, match_length}} ->
        match_end = match_start + match_length

        matched_word = binary_part(sentence, match_start, match_length)

        remaining_sentence =
          binary_part(
            sentence,
            match_end,
            byte_size(sentence) - match_end
          )

        {matched_word, remaining_sentence}

      _ ->
        nil
    end
  end
end
