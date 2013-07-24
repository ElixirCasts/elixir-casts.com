defmodule ElixirCasts.Dynamo do
  use Dynamo

  config :dynamo,
    # The environment this Dynamo runs on
    env: Mix.env,

    # The OTP application associated to this Dynamo
    otp_app: :elixir_casts,

    # The endpoint to dispatch requests to
    endpoint: ApplicationRouter,

    # The route from where static assets are served
    # You can turn off static assets by setting it to false
    static_route: "/static"

  # Uncomment the lines below to enable the cookie session store
  # config :dynamo,
  #   session_store: Session.CookieStore,
  #   session_options:
  #     [ key: "_elixir_casts_session",
  #       secret: "j6bfZJRBecyk4CvoSNMzMoShDFKQYkZlP3UReHK+asqF/KwOatOF8UdeC/DEG3ES"]

  # Default functionality available in templates
  templates do
    use Dynamo.Helpers
    import ElixirCasts.Helpers
  end
end
