defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "when a valid file is provided, returns the converted list" do
      expected_response = {:ok, [1, :buzz, :buzz, :fizzbuzz, :buzz, 4, 2, :fizz, 7, :fizz, :fizz, 32]}
      assert FizzBuzz.build("./lib/numbers.txt") == expected_response
    end

    test "when an invalid file is provided, returns an error" do
      expected_response = {:error, "error reading the file: enoent"}
      assert FizzBuzz.build("invalid.txt") == expected_response

    end
  end
end
