defmodule JunkmanagerWeb.ItemView do
  use JunkmanagerWeb, :view

  def get_price_string(price) when is_float(price) do
    price_formatted = get_price_formatted(price)
    "$#{price_formatted}"
  end
  
  def get_price_string(price) when is_nil(price) do
    "_"
  end
  
  def get_price_formatted(price) when is_float(price) do
    Float.to_string(price, decimals: 2)
  end
  
  def get_price_formatted(price) when is_nil(price) do
    ""
  end
end
