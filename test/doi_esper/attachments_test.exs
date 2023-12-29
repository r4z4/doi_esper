defmodule DoiEsper.AttachmentsTest do
  use ExUnit.Case
  alias DoiEsper.Core.Attachment

  describe "to_attachment/1" do
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
  end
end
