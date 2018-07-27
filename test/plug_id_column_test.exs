defmodule PlugIdColumnTest do
  use ExUnit.Case
  doctest PlugIdColumn

  test "with data_key and id_column" do
    payload = %{
      status: :ok,
      data: %{
        some_list: [%{
          id: 1,
          name: "one"
        },%{
          id: 2,
          name: "two"
        },%{
          id: 3,
          name: "three"
        }]
      }
    } |> Poison.encode_to_iodata!()

    {data_key, key} = {"some_list", "name"}
    %{resp_body: resp_body} = PlugIdColumn.call_back(%{resp_body: payload, params: %{"id_column" => key, "data_key" => data_key}})
    assert %{
      "data" => %{
        "some_list" => %{
          "one" => %{"id" => 1, "name" => "one"},
          "three" => %{"id" => 3, "name" => "three"},
          "two" => %{"id" => 2, "name" => "two"}
        }
      },
      "status" => "ok"
    } = Poison.decode!(resp_body)
  end
  
  test "with only id_column" do
    payload = %{
      status: :ok,
      data: [%{
        id: 1,
        name: "one"
      },%{
        id: 2,
        name: "two"
      },%{
        id: 3,
        name: "three"
      }]
    } |> Poison.encode_to_iodata!()

    {_data_key, key} = {nil, "name"}
    %{resp_body: resp_body} = PlugIdColumn.call_back(%{resp_body: payload, params: %{"id_column" => key}})

    assert %{
      "data" =>  %{
        "one" => %{"id" => 1, "name" => "one"},
        "three" => %{"id" => 3, "name" => "three"},
        "two" => %{"id" => 2, "name" => "two"}
      },
      "status" => "ok"
    } = Poison.decode!(resp_body)
  end
end
