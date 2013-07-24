defmodule ElixirCasts.Helpers do
  import Mix.Utils

  @basepath "priv/static/js/"

  @moduledoc """
    Custom View Helpers for the ElixirCasts site
  """

  @doc """
    Takes the path to an exs file defining the module ElixirCasts.JSManifest and
    and a minifest function that returns an array it will then create scrip tags
    for all files in that manifest
  """
  def javascript_include(manifest_path) do
    "#{@basepath}#{manifest_path}.exs"
    |>
    Code.load_file
    |>
    do_build_tags
  end

  defp do_build_tags([{ElixirCasts.JSManifest, _}|_]) do
    Enum.map(ElixirCasts.JSManifest.manifest, expand(&1))
    |>
    List.flatten
    |>
    Enum.uniq
    |>
    Enum.map(script_taggify(&1))
    |>
    Enum.join("\n")
  end

  defp do_build_tags([{module,_},_]) do
    raise "Module JSManifest expected but #{inspect module} defined"
  end

  defp expand(path) do
    full_path = "#{@basepath}#{path}"
    case File.dir? full_path do
      true ->
        extract_files [full_path], ["js"]
      _ ->
        File.exists?("#{full_path}.js") && "#{full_path}.js"
    end
  end

  defp script_taggify(false), do: nil
  defp script_taggify(path) do
    relative_path = String.replace path, "priv", ""
    "<script src='#{relative_path}'></script>"
  end
end
