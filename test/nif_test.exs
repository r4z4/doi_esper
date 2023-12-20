defmodule DoiEsper.NifTest do
  use ExUnit.Case, async: true
  alias DoiEsper.XmlParse

  test "nif works just fine" do
    assert XmlParse.add(4,5) == 9
  end
end
