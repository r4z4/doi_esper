defmodule DoiEsper.CityTest do
  use ExUnit.Case
  alias DoiEsper.Entities.City
  alias DoiEsper.Core.Error

  describe "new/1" do

    # setup do
    #   ctrl_attachment = %Attachment{id: "0aab625c-c034-4066-89f6-095a6fe761a8", title: "Title", path: "../title/path", type: 1, data: nil}
    # end

    test "success: converts map to city struct" do
      object = %{
        "name" => "Omaha",
        "state" => :NE,
        "latitude" => 45.33333,
        "longitude" => 43.44444,
        "population" => 4_444,
        "median_age" => 55,
        "median_income" => 55555,
      }
      ctrl_city = %City{name: "Omaha", state: :NE, latitude: 45.33333, longitude: 43.44444, population: 4_444, median_age: 55, median_income: 55555}

      assert City.new(object) == ctrl_city
    end

    test "error: name error yields name error" do
      object = %{
        "name" => "O",
        "state" => :NE,
        "latitude" => 45.33333,
        "longitude" => 43.44444,
        "population" => 4_444,
        "median_age" => 55,
        "median_income" => 55555,
      }

      assert City.new(object) == [%Error{type: "Validation", text: "Invalid Name"}]
    end

    test "error: state type error yields state type error" do
      object = %{
        "name" => "Omaha",
        "state" => 7,
        "latitude" => 45.33333,
        "longitude" => 43.44444,
        "population" => 4_444,
        "median_age" => 55,
        "median_income" => 55555,
      }

      assert City.new(object) == [%Error{type: "Validation", text: "Invalid State Type"}]
    end

    test "error: state error yields state error" do
      object = %{
        "name" => "Omaha",
        "state" => :XX,
        "latitude" => 45.33333,
        "longitude" => 43.44444,
        "population" => 4_444,
        "median_age" => 55,
        "median_income" => 55555,
      }

      assert City.new(object) == [%Error{type: "Validation", text: "Invalid State"}]
    end

    test "error: state & name errors yields state & name errors" do
      object = %{
        "name" => "O",
        "state" => :XX,
        "latitude" => 45.33333,
        "longitude" => 43.44444,
        "population" => 4_444,
        "median_age" => 55,
        "median_income" => 55555,
      }

      assert City.new(object) == [%Error{type: "Validation", text: "Invalid State"}, %Error{type: "Validation", text: "Invalid Name"}]
    end

    test "error: population length error yields population length error" do
      object = %{
        "name" => "Omaha",
        "state" => :NE,
        "latitude" => 45.33333,
        "longitude" => 43.44444,
        "population" => 4_444_555_555,
        "median_age" => 55,
        "median_income" => 55555,
      }

      assert City.new(object) == [%Error{type: "Validation", text: "Invalid Population Size"}]
    end

    test "error: population type error yields population type error" do
      object = %{
        "name" => "Omaha",
        "state" => :NE,
        "latitude" => 45.33333,
        "longitude" => 43.44444,
        "population" => "Big",
        "median_age" => 55,
        "median_income" => 55555,
      }

      assert City.new(object) == [%Error{type: "Validation", text: "Invalid Population Type"}]
    end
  end
end
