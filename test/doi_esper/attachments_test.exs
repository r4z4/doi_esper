defmodule DoiEsper.AttachmentsTest do
  use ExUnit.Case
  alias DoiEsper.Core.Attachment

  describe "to_attachment/1" do

    # setup do
    #   response_as_string =
    #     File.read!("test/support/weather_api_response.json")
    #   response_as_map = Jason.decode!(response_as_string)
    #   %{weather_data: response_as_map}
    # end

    test "success: converts map to attachments struct" do
      object = %{
        "id" => "0aab625c-c034-4066-89f6-095a6fe761a8",
        "title" => "Title",
        "path" => "../title/path",
        "type" => 1,
        "data" => nil,
      }

      attachment = %Attachment{id: "0aab625c-c034-4066-89f6-095a6fe761a8", title: "Title", path: "../title/path", type: 1, data: nil}

      assert Attachment.to_attachment(object) == attachment
    end

    test "error: missing field raises error" do
      object = %{
        "id" => "0aab625c-c034-4066-89f6-095a6fe761a8",
        "title" => "Title",
        # "path" => "../title/path",
        "type" => 1,
        "data" => nil,
      }

      attachment = %Attachment{id: "0aab625c-c034-4066-89f6-095a6fe761a8", title: "Title", path: "../title/path", type: 1, data: nil}

      assert Attachment.to_attachment(object) == attachment
    end
  end
end
