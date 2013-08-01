defmodule Apprentice.Workshop do
  def apprentices do
    [Apprentice.ExUnit, Apprentice.Handlebars, Apprentice.CoffeScript] #return all the apprentices you would like to run
  end

  def exunit_paths do
    ["lib", "test"]
  end

  def handlebars_template_paths do
    ["priv/assets/js/templates"]
  end

  def handlebars_output_path do
    "priv/static/js/templates"
  end

  def coffee_script_files_paths do
    ["priv/assets/js/"]
  end

  def coffee_script_output_path do
    "priv/static/js"
  end
end
