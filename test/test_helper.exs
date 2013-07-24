Dynamo.under_test(ElixirCasts.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule ElixirCasts.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end
