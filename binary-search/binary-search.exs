defmodule BinarySearch do
    
    defp search(_, _, startIdx, lastIdx) when startIdx > lastIdx, do: {:error, "Element not found"}

    defp search(num, list, startIdx, lastIdx) do
        midIdx = Integer.floor_div(startIdx + lastIdx, 2)
        midNum = list |> Enum.at(midIdx)

        cond do
            midNum == num -> {:ok, midIdx}
            midNum > num  -> search(num, list, startIdx, midIdx - 1)
            midNum < num  -> search(num, list, midIdx + 1, lastIdx)
        end
    end

    def search(num, list) do
        search(num, list, 0, length(list) - 1)
    end

end

#Test
ExUnit.start
defmodule BinarySearchTest do
    use ExUnit.Case

    test "Element not found in list" do
        assert BinarySearch.search(0, [1, 2, 3, 4]) == {:error, "Element not found"}
    end

    test "Element not found in empty list" do
        assert BinarySearch.search(0, []) == {:error, "Element not found"}
    end

    test "Element found in first position" do
        assert BinarySearch.search(1, [1, 2, 3, 4]) == {:ok, 0}
    end

    test "Element found in last position" do
        assert BinarySearch.search(4, [1, 2, 3, 4]) == {:ok, 3}
    end

    test "Element found in random position" do
        assert BinarySearch.search(3, [1, 2, 3, 4]) == {:ok, 2}
    end
end
