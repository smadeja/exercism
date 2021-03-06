defmodule Integer.Guards do
  defguard is_lowercase(value) when value in ?a..?z
  defguard is_uppercase(value) when value in ?A..?Z
end

defmodule RotationalCipher do
  import Integer.Guards

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text |> do_rotate(shift)
  end

  @spec do_rotate(String.t(), integer(), String.t()) :: String.t()
  defp do_rotate(text, shift, accumulator \\ "")

  defp do_rotate(<<text_head>> <> text_tail, shift, accumulator) do
    do_rotate(text_tail, shift, accumulator <> <<encode_letter(text_head, shift)>>)
  end

  defp do_rotate("", _shift, accumulator), do: accumulator

  @spec encode_letter(integer(), integer()) :: integer()

  defp encode_letter(letter, shift) when is_lowercase(letter) do
    ((letter - ?a + shift) |> Integer.mod(26)) + ?a
  end

  defp encode_letter(letter, shift) when is_uppercase(letter) do
    ((letter - ?A + shift) |> Integer.mod(26)) + ?A
  end

  defp encode_letter(letter, _shift), do: letter
end
