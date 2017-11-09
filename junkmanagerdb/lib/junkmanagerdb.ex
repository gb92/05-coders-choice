defmodule Junkmanagerdb do
  alias Junkmanagerdb.Impl

  defdelegate add(name, description, purchase_price), to: Impl
  defdelegate add(name, description), to: Impl
  defdelegate list_item_names(), to: Impl
  defdelegate find_item(id), to: Impl
  defdelegate update_item(id, updates), to: Impl
end
