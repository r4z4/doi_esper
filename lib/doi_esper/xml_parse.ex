defmodule DoiEsper.XmlParse do
  use Rustler, otp_app: :doi_esper, crate: "xml_parse"

  # When your NIF is loaded, it will override this function.
  def add(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
  def parse(_xml_data), do: :erlang.nif_error(:nif_not_loaded)
  def parse_file(_file_path), do: :erlang.nif_error(:nif_not_loaded)
end
