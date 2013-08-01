defmodule Apprentice.CoffeScript do
  @moduledoc """
    Currently requires node and a node ember precompiler

    OSX: Brew install node
         npm install -g ember-precompile
    Workshop file must define the following:
      "handlebars_template_paths" return List
      "handlebars_output_path" return String
  """

  def run do
    IO.puts "Your aprentice is watching your coffescript files"
    paths = Apprentice.Workshop.coffee_script_files_paths
    ports = Apprentice.watch(paths)
    Apprentice.Server.start_link Apprentice.update_files(paths, ["coffee"]), :coffee, fn
      changed, manifest -> on_change(changed, manifest)
    end
    do_run(paths, ports)
  end

  #TODO Change this to use erjang_js runtime
  def on_change(changed_files, all_files) do
    Enum.each changed_files, fn({file, _}) ->
      output_path = Apprentice.Workshop.coffee_script_output_path
      IO.puts "Your apprentice is brewing your coffee: #{file} to #{output_path}"
      System.cmd("coffee -o #{output_path}/ -c #{file}")
    end
  end

  defp do_run(paths, ports) do
    receive do
      { port, _ } ->
        if port in ports do
          new_manifest = Apprentice.update_files(paths, ["coffee"])
          Apprentice.Server.update_files(new_manifest, :coffee)
        end
        { :EXIT, _, reason } ->
        raise "No longer watching #{__MODULE__}. Reason: #{reason}"
    end
    do_run(paths, ports)
  end
end
