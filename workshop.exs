defmodule Apprentice.Workshop do
  def apprentices do
    [Apprentice.ExUnit, Apprentice.Handlebars] #return all the apprentices you would like to run
  end

  def exunit_paths do
    ["lib", "test"]
  end

  def handlebars_template_paths do
    ["priv/static/js/templates"]
  end

  def handlebars_output_path do
    "priv/static/js/templates"
  end
end
