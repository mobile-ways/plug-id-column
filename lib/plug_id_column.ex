defmodule PlugIdColumn do
  @moduledoc """
  Documentation for PlugIdColumn.
  """

  @spec init(list) :: list
  def init(options), do: options

  def call(conn, _opts) do
      conn |> Plug.Conn.register_before_send(&__MODULE__.call_back/1)
  end

  def call_back(%{resp_body: resp_body, params: %{"id_column" => key}}=conn) do
    encoder = get_json_encoder()
    with {:ok, %{"data" => data}=body} <- encoder.decode(resp_body),
      data <- hash_id_column(data, key),
      body <-  Map.merge(body, %{"data" => data}),
      {:ok, body} <- encoder.encode_to_iodata(body) do
        %{conn | resp_body: body}
      else 
        _error ->
          conn
    end
  end
  def call_back(conn), do: conn

  def hash_id_column(data, key) when is_list(data) do
    data |> Enum.map(&({&1 |> Map.get(key), &1})) |> Map.new
  end
  def hash_id_column(data, _key), do: data

  # TUDO: Fix it
  defp get_json_encoder do
    Application.get_env(:phoenix, :format_encoders)
    |> Keyword.get(:json, Poison)
  end

end