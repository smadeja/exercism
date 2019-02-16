defmodule SecretHandshake do
  use Bitwise

  @secret_moves [
    {0b0001, "wink"},
    {0b0010, "double blink"},
    {0b0100, "close your eyes"},
    {0b1000, "jump"}
  ]

  @secret_reverse_bit 0b10000

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    extract_secret_move_sequence(@secret_moves, code, [])
  end

  @spec extract_secret_move_sequence(
          list({secret_code :: integer(), secret_move :: String.t()}),
          code :: integer(),
          secret_move_sequence :: list()
        ) ::
          list(String.t())

  defp extract_secret_move_sequence(
         [{secret_code, secret_move} | remaining_secret_moves],
         code,
         secret_move_sequence
       ) do
    case code &&& secret_code do
      0 ->
        extract_secret_move_sequence(
          remaining_secret_moves,
          code,
          secret_move_sequence
        )

      _ ->
        extract_secret_move_sequence(
          remaining_secret_moves,
          code,
          [secret_move | secret_move_sequence]
        )
    end
  end

  defp extract_secret_move_sequence([], code, secret_move_sequence) do
    case @secret_reverse_bit &&& code do
      0 ->
        Enum.reverse(secret_move_sequence)

      _ ->
        secret_move_sequence
    end
  end
end
