defmodule DoiEsper.NifTest do
  use ExUnit.Case, async: true
  alias DoiEsper.XmlParse
  alias DoiEsper.Sales.TownData

  test "nif works just fine" do
    assert XmlParse.add(4,5) == 9
  end

  # @spec nif_parse(String.t()) :: [TownData.t()]
  test "nif parses string" do
    xml_string = "<row _id='row-7zj4.yaci_5zr9' _uuid='00000000-0000-0000-4035-2A02EF7714F7' _position='0' _address='https://data.ct.gov/resource/_3udy-56vi/row-7zj4.yaci_5zr9'><year>2020</year><code>1</code><town>Andover</town><_2010_census>1317</_2010_census><gov_assisted>18</gov_assisted><tenant_rental_assistance>1</tenant_rental_assistance><chfa_usda_mortgages>32</chfa_usda_mortgages><deed_restricted>0</deed_restricted><total_assisted>51</total_assisted><percent_assisted>3.8699999999999997</percent_assisted></row>"
    town_data = %TownData{year: 2020, code: 1, town: "Andover", _2010_census: 1317, gov_assisted: 18, tenant_rental_assistance: 1, chfa_usda_mortgages: 32, deed_restricted: 0, total_assisted: 51, percent_assisted: 3.8699999999999997}
    assert town_data |> Map.delete(:__meta__) |> Map.delete(:id) == List.first(XmlParse.parse(xml_string))
  end

  test "nif parses file" do
    file_path = "./priv/static/files/housing.xml"
    town_data = %TownData{_2010_census: 2019, chfa_usda_mortgages: 36, code: 114, deed_restricted: 0, gov_assisted: 40, percent_assisted: 4.06, tenant_rental_assistance: 6, total_assisted: 82, town: "Preston", year: 2022}
    assert town_data |> Map.delete(:__meta__) |> Map.delete(:id) == List.first(XmlParse.parse_file(file_path))
  end
end
