# Skipper

[![Build Status](https://github.com/iamvery/skipper/actions/workflows/ci.yml/badge.svg)](https://github.com/iamvery/skipper/actions/workflows/ci.yml) [![Hex.pm](https://img.shields.io/hexpm/v/skipper.svg)](https://hex.pm/packages/skipper)

LiveView tests tend to leak details that distract from the system behavior
you're testing. Skip the noise and let the Skipper patch the leaks so you can
sail on in your well-tested craft.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `skipper` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:skipper, "~> 0.1.0", only: :test}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/skipper>.

## Phoenix LiveView Test Helpers

I've put together a set of test helper functions for testing Phoenix LiveView.
For more details on this pattern, see the [blog post][live-view-helpers-blog].

As a quick example, the helpers let you go from:

```elixir
import Phoenix.LiveViewTest

test "live view", %{conn: conn} do
  {:ok, live, html} = live(conn, "/")
  assert html =~ "New"
  assert live |> element("a.new") |> render_click() =~ "Enter new"
  assert_patch(live, "/new")
  {:ok, _, html} = live |> form(".form", @attrs) |> render_submit() |> follow_redirect(conn)
  assert html =~ "success"
end
```

To:

```elixir
use Skipper.LiveViewTest

test "live view", %{conn: conn} do
  start(conn, "/")
  |> assert_visible("New")
  |> click("a.new")
  |> assert_visible("Enter new")
  |> submit_form(".form", @attrs)
  |> assert_visible(".alert", "success")
end
```

## Copyright and License

Copyright (c) 2022, Jay Hayes.

Source code is licensed under the [MIT License](LICENSE.md).


[live-view-helpers-blog]: https://iamvery.com/2022/10/19/better-live-view-tests.html
