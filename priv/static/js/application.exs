defmodule ElixirCasts.JSManifest do
  @doc """
    This manifest takes file or directories relative the the priv/static/js
    directory. It loads them in order
  """
  def manifest do
    ["libs/jquery-1.9.1", "libs/handlebars-1.0.0-rc.4", "libs", "/"]
  end
end
