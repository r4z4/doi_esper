defmodule DoiEsper.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DoiEsper.Accounts` context.
  """

  def unique_user_email, do: "user#{System.unique_integer()}@example.com"
  def valid_user_password, do: "hello world!"
  def valid_user_city, do: "Omaha"
  def valid_user_state, do: "NE"
  def valid_user_username, do: Ecto.UUID.generate()
  def unique_user_f_name, do: "Jim"
  def unique_user_l_name, do: "Jones"

  def valid_user_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      email: unique_user_email(),
      f_name: unique_user_f_name(),
      l_name: unique_user_l_name(),
      password: valid_user_password(),
      username: valid_user_username(),
      city: valid_user_city(),
      state: valid_user_state()
    })
  end

  @spec user_fixture(any()) :: any()
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> valid_user_attributes()
      |> DoiEsper.Accounts.register_user()

    user
  end

  def extract_user_token(fun) do
    {:ok, captured_email} = fun.(&"[TOKEN]#{&1}[TOKEN]")
    [_, token | _] = String.split(captured_email.text_body, "[TOKEN]")
    token
  end
end
