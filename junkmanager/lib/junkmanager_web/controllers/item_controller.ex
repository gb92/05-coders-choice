defmodule JunkmanagerWeb.ItemController do
  use JunkmanagerWeb, :controller

  def create(conn, %{"item" => %{"name" => name, "description" => description, "purchase_price" => purchase_price}}) do
    %{id: user_id} = Doorman.Login.Session.get_current_user(conn)

    %{ id: new_id } = Junkmanagerdb.add(name, description, user_id, purchase_price)
    redirect(conn, to: item_path(conn, :show, new_id))
  end

  def create(conn, %{"item" => %{"name" => name, "description" => description}}) do
    %{id: user_id} = Doorman.Login.Session.get_current_user(conn)

    %{ id: new_id } = Junkmanagerdb.add(name, description, user_id)
    redirect(conn, to: item_path(conn, :show, new_id))
  end

  def show(conn, %{ "id" => item_id }) do
    %{id: user_id} = Doorman.Login.Session.get_current_user(conn)

    item = Junkmanagerdb.find_item(item_id, user_id)
    show_navigate(conn, item)
  end

  def show_navigate(conn, item) when is_nil(item) do
    redirect(conn, to: item_path(conn, :item_list))
  end

  def show_navigate(conn, item) do
    render(conn, "show.html", item: item)
  end

  def dashboard(conn, params) do
    %{id: user_id} = Doorman.Login.Session.get_current_user(conn)
    items = Junkmanagerdb.list_items_for_user(user_id)

    render(conn, "dashboard.html", items: items)
  end

  def item_form(conn, _params) do 
    render(conn, "new_item.html")
  end

  def item_list(conn, _params) do
    %{id: user_id} = Doorman.Login.Session.get_current_user(conn)

    items = Junkmanagerdb.list_items_for_user(user_id)
    render(conn, "items.html", items: items)
  end

  def edit_item(conn, %{ "id" => item_id}) do
    %{id: user_id} = Doorman.Login.Session.get_current_user(conn)
    
    item = Junkmanagerdb.find_item(item_id, user_id)
    edit_item_navigate(conn, item)
  end

  def edit_item_navigate(conn, item) when is_nil(item) do
    redirect(conn, to: item_path(conn, :item_list))
  end

  def edit_item_navigate(conn, item) do
    render(conn, "update_item.html", item: item)
  end

  def delete_item(conn, %{ "id" => item_id}) do
    %{id: user_id} = Doorman.Login.Session.get_current_user(conn)

    Junkmanagerdb.delete_item(item_id, user_id)
    redirect(conn, to: item_path(conn, :item_list))
  end

  def update_item(conn, %{ "id" => item_id, "item" => updates}) do
   %{id: user_id} = Doorman.Login.Session.get_current_user(conn)

   Junkmanagerdb.update_item(item_id, updates, user_id)
   redirect(conn, to: item_path(conn, :show, item_id))
  end
end