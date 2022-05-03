defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file()

  end

  defp handle_file({:ok, result}) do
    result
      |> String.split(",")
      |> Enum.map(&String.trim/1)
      |> convert_and_evaluate_numbers()

  end

  defp handle_file({:error, reason}), do: {:error, "error reading the file: #{reason}"}

  defp convert_and_evaluate_numbers(elem) do
    result =
      elem
      |> Enum.map(&String.to_integer/1)
      |> Enum.map(&is_fizz_or_buzz/1)

    {:ok, result}

  end

  defp is_fizz_or_buzz(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp is_fizz_or_buzz(number) when rem(number, 3) == 0, do: :fizz
  defp is_fizz_or_buzz(number) when rem(number, 5) == 0, do: :buzz
  defp is_fizz_or_buzz(number), do: number

end
