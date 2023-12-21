defmodule DoiEsper.ImageEncode do
  use Rustler, otp_app: :doi_esper, crate: "image_encode"

  # When your NIF is loaded, it will override this function.
  def add(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
  def jpg(_, _, _), do: :erlang.nif_error(:nif_not_loaded)
end
