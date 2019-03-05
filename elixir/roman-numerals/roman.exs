defmodule Roman do
  @ordered_mapping [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer()) :: String.t()
  def numerals(number) do
    number |> arabic_to_roman()
  end

  @spec arabic_to_roman(
          non_neg_integer(),
          [{pos_integer(), String.t()}],
          String.t()
        ) ::
          String.t()
  defp arabic_to_roman(
         number,
         ordered_mapping \\ @ordered_mapping,
         accumulator \\ ""
       )

  defp arabic_to_roman(
         number,
         [{value, symbol} | _tail] = ordered_mapping,
         accumulator
       )
       when number > 0 and number |> div(value) > 0 do
    accumulator = accumulator <> symbol
    number = number - value

    arabic_to_roman(number, ordered_mapping, accumulator)
  end

  defp arabic_to_roman(number, [_head | tail], accumulator)
       when number > 0 do
    arabic_to_roman(number, tail, accumulator)
  end

  defp arabic_to_roman(0, _ordered_mapping, accumulator) do
    accumulator
  end
end
