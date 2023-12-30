defmodule DoiEsper.MessageTest do
  use ExUnit.Case
  alias DoiEsper.Site.Message
  alias DoiEsper.Core.Error

  describe "new/1" do

    # setup do
    #   ctrl_attachment = %Attachment{id: "0aab625c-c034-4066-89f6-095a6fe761a8", title: "Title", path: "../title/path", type: 1, data: nil}
    # end

    test "success: converts map to message struct" do
      test_id = UUIDv7.generate()
      object = %{
        "id" => test_id,
        "to" => "b5f44567-e031-44f1-aae6-972d7aabbb45",
        "from" => "df18d5eb-e99e-4481-9e16-4d2f434a3711",
        "subject" => "Test Subject",
        "type" => :p2p,
        "text" => "Test Message Test",
        "read" => false,
        "saved" => false,
      }
      ctrl_message = %Message{id: test_id, to: "b5f44567-e031-44f1-aae6-972d7aabbb45", from: "df18d5eb-e99e-4481-9e16-4d2f434a3711", subject: "Test Subject", type: :p2p, text: "Test Message Test", read: false, saved: false}

      assert Message.new(object) == ctrl_message
    end

    test "error: to error yields to error" do
      test_id = UUIDv7.generate()
      object = %{
        "id" => test_id,
        "to" => 2,
        "from" => "df18d5eb-e99e-4481-9e16-4d2f434a3711",
        "subject" => "Test Subject",
        "type" => :p2p,
        "text" => "Test Message Test",
        "read" => false,
        "saved" => false,
      }

      assert Message.new(object) == [%Error{type: "Validation", text: "Invalid To"}]
    end

    test "error: from error yields from error" do
      test_id = UUIDv7.generate()
      object = %{
        "id" => test_id,
        "to" => "df18d5eb-e99e-4481-9e16-4d2f434a3711",
        "from" => 5,
        "subject" => "Test Subject",
        "type" => :p2p,
        "text" => "Test Message Test",
        "read" => false,
        "saved" => false,
      }

      assert Message.new(object) == [%Error{type: "Validation", text: "Invalid From"}]
    end

    test "error: subject type error yields subject type error" do
      test_id = UUIDv7.generate()
      object = %{
        "id" => test_id,
        "to" => "df18d5eb-e99e-4481-9e16-4d2f434a3711",
        "from" => "b5f44567-e031-44f1-aae6-972d7aabbb45",
        "subject" => 1,
        "type" => :p2p,
        "text" => "Test Message Test",
        "read" => false,
        "saved" => false,
      }

      assert Message.new(object) == [%Error{type: "Validation", text: "Invalid Subject Type"}]
    end

    test "error: subject length error yields subject length error" do
      test_id = UUIDv7.generate()
      object = %{
        "id" => test_id,
        "to" => "df18d5eb-e99e-4481-9e16-4d2f434a3711",
        "from" => "b5f44567-e031-44f1-aae6-972d7aabbb45",
        "subject" => "ThisIsAVeryLongSubjectMoreThanTwentyCharacters",
        "type" => :p2p,
        "text" => "Test Message Test",
        "read" => false,
        "saved" => false,
      }

      assert Message.new(object) == [%Error{type: "Validation", text: "Invalid Subject Length"}]
    end
  end
end
