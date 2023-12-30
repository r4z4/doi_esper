defmodule DoiEsper.AttachmentsTest do
  use ExUnit.Case
  alias DoiEsper.Core.Attachment
  alias DoiEsper.Core.Error

  describe "to_attachment/1" do

    # setup do
    #   ctrl_attachment = %Attachment{id: "0aab625c-c034-4066-89f6-095a6fe761a8", title: "Title", path: "../title/path", type: 1, data: nil}
    # end

    test "success: converts map to attachments struct" do
      object = %{
        "id" => "0aab625c-c034-4066-89f6-095a6fe761a8",
        "title" => "Title",
        "path" => "../title/path",
        "type" => 1,
        "data" => nil,
      }
      ctrl_attachment = %Attachment{id: "0aab625c-c034-4066-89f6-095a6fe761a8", title: "Title", path: "../title/path", type: 1, data: nil}

      assert Attachment.to_attachment(object) == ctrl_attachment
    end

    test "error: path error yields path error" do
      object = %{
        "id" => "0aab625c-c034-4066-89f6-095a6fe761a8",
        "title" => "Title",
        "path" => 1,
        "type" => 1,
        "data" => nil,
      }

      assert Attachment.to_attachment(object) == [%Error{type: "Validation", text: "Invalid Path"}]
    end

    test "error: title error yields title error" do
      object = %{
        "id" => "0aab625c-c034-4066-89f6-095a6fe761a8",
        "title" => "TitleThatIsWayTooLongToPassAValidationTestSoItWillError",
        "path" => "../title/path",
        "type" => 1,
        "data" => nil,
      }

      assert Attachment.to_attachment(object) == [%Error{type: "Validation", text: "Invalid Title"}]
    end
  end
end
