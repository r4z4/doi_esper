defmodule DoiEsperWeb.ImageLive.Index do
  use DoiEsperWeb, :live_view

  @image_data "image_data"
  embed_templates "dashboard_html/*"
  # alias DoiEsper.Streams.Stream

  @impl true
  def handle_call(:ping, _from, state) do
    {:reply, {:pong, state[:id]}, state}
  end

  def subscribe_to_services do
    DoiEsperWeb.Endpoint.subscribe(@image_data)
  end

  @impl true
  # def mount(_params, _session, socket) do
  #   {:ok, stream(socket, :stream_collection, Streams.list_stream())}
  # end

  def mount(_params, _session, socket) do
    subscribe_to_services()
    init_map = %{1 => false, 2 => false}
    IO.puts "Subscribing"
    {:ok,
      socket
      |> assign(:clicked_map, init_map)
      |> assign(:image_data, nil)
      |> assign(:uploaded_files, [])
      |> allow_upload(:avatar, accept: ~w(.png .svg), max_entries: 5)
    }
  end

  @impl true
  def handle_event("service_casted", params, socket) do
    clicked_map = socket.assigns.clicked_map
    {int, _rem} = Integer.parse(params["id"])
    adjusted_map = Map.put(clicked_map, int, !clicked_map[int])
    case Kernel.elem(Integer.parse(params["id"]), 0) do
      # GenServer.cast String.to_existing_atom(params["castto"]), {String.to_existing_atom(params["op"]), String.to_existing_atom(params["res"])}
      1 -> GenServer.cast :xml_server, {:fetch_resource, :xml_parse}
      2 -> GenServer.cast :api_server, {:fetch_resource, :addrs}
      _ ->
        IO.puts "No Service Casted"
    end
    {:noreply,
      socket
      |> assign(clicked_map: adjusted_map)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    stream = Streams.get_stream!(id)
    {:ok, _} = Streams.delete_stream(stream)

    {:noreply, stream_delete(socket, :stream_collection, stream)}
  end

  @impl Phoenix.LiveView
  def handle_event("cancel-upload", %{"ref" => ref}, socket) do
    {:noreply, cancel_upload(socket, :avatar, ref)}
  end

  @impl Phoenix.LiveView
  def handle_event("validate", _params, socket) do
    {:noreply, socket}
  end

  @impl Phoenix.LiveView
  def handle_event("save", _params, socket) do
    uploaded_files =
      consume_uploaded_entries(socket, :avatar, fn %{path: path}, _entry ->
        IO.inspect(Path.extname(path), label: "Path")
        # Actually might not even need this
        # ext =
        #   case ExMarcel.MimeType.for {:path, path} do
        #     "video/mp4" -> ".m4a"
        #     "audio/mp3" -> ".mp3"
        #     _           -> ""
        #   end
        # dest = Path.join([:code.priv_dir(:stream_handler), "static", "uploads", Path.basename(path)])
        # FIXME use ExMarcel to detect MIME type
        dest = Path.join(["./files/uploads", Path.basename(path)])
        File.cp!(path, dest)
        {:ok, "./files/uploads/#{Path.basename(dest)}"}
      end)

    # Files now ready to be transcribed.
    Enum.map(uploaded_files, fn file ->
      idx = Enum.find_index(uploaded_files, fn x -> x == file end)
      atom =
        case idx do
          0 -> :a
          1 -> :c
          2 -> :d
          3 -> :e
        end
      GenServer.cast atom, {:ner_pipeline, file, atom}
    end)

    {:noreply, update(socket, :uploaded_files, &(&1 ++ uploaded_files))}
  end

  @impl true
  def handle_info({DoiEsperWeb.StreamLive.FormComponent, {:saved, stream}}, socket) do
    {:noreply, stream_insert(socket, :stream_collection, stream)}
  end


  @impl true
  def handle_info(%{topic: @addrs, payload: msg}, socket) do
    IO.inspect(socket)
    IO.puts "Handle Broadcast for Addrs"
    {:noreply,
      socket
      |> assign(:addrs, msg[:data])
    }
  end

  @impl true
  def handle_info(%{event: "new_message", payload: new_message}, socket) do
    # updated_messages = socket.assigns[:messages] ++ [new_message]
    IO.inspect(socket, label: "Socket")
    case new_message do
        "{\"event\":\"heartbeat\"}" ->
            IO.puts "Kraken Heartbeat"
            {:noreply, socket}
        %{"event" => "heartbeat"} ->
            IO.puts "Kraken Heartbeat Map"
            {:noreply, socket}
        _ ->
            new_message = %{id: List.first(new_message), data: Kernel.elem(List.pop_at(new_message, 1), 0)}
            IO.inspect(new_message, label: "The New Message!!")
            {:noreply,
                socket
                |> stream_insert(:messages, new_message)}
    end
  end
  defp error_to_string(:too_large), do: "Too large"
  defp error_to_string(:too_many_files), do: "You have selected too many files"
  defp error_to_string(:not_accepted), do: "You have selected an unacceptable file type"
end
