defmodule Junkmanagerdb do
  alias Junkmanagerdb.Impl

  defdelegate add(name, description, purchase_price, user), to: Impl
  defdelegate add(name, description, user), to: Impl
  defdelegate list_item_names(), to: Impl
  defdelegate list_items(), to: Impl
  defdelegate list_items_for_user(user), to: Impl
  defdelegate find_item(id, user_id), to: Impl
  defdelegate update_item(id, updates, user_id), to: Impl
  defdelegate delete_item(id, user_id), to: Impl
  defdelegate add_user(username, email, password), to: Impl
  defdelegate auth_user(email, password), to: Impl
end
