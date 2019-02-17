defmodule Integer.Guards do
  defguard is_lowercase(value) when value in 97..122
  defguard is_uppercase(value) when value in 65..90
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
  defp do_rotate(text, shift, result \\ "")

  defp do_rotate(<<text_head>> <> text_tail, shift, result) do
    do_rotate(text_tail, shift, result <> <<encode_letter(text_head, shift)>>)
  end

  defp do_rotate("", _shift, result), do: result

  @spec encode_letter(integer(), integer()) :: integer()

  defp encode_letter(letter, shift) when is_lowercase(letter) do
    ((letter - 97 + shift) |> Integer.mod(26)) + 97
  end

  defp encode_letter(letter, shift) when is_uppercase(letter) do
    ((letter - 65 + shift) |> Integer.mod(26)) + 65
  end

  defp encode_letter(letter, _shift), do: letter
end
