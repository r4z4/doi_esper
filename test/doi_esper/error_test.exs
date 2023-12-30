defmodule DoiEsper.ErrorTest do
  use ExUnit.Case
  alias DoiEsper.Core.Error
  alias DoiEsper.Core.ErrorList

  describe "empty?/1" do
    test "empty? returns true for empty" do
      object = %ErrorList{
        :errors => [],
      }
      assert ErrorList.empty?(object) == true
    end

    test "empty? returns false for populated" do
      object = %ErrorList{
        :errors => [%Error{type: :validation, text: "Test"}],
      }
      assert ErrorList.empty?(object) == false
    end
  end
end
