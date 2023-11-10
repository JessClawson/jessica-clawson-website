defmodule Utils.CssUtils do
    alias Phoenix.LiveView.JS

    def show_mobile_sidebar(js \\ %JS{}) do
        js
        |> JS.show(to: "#mobile-sidebar-container", transition: "fade-in")
        |> JS.show(
        to: "#mobile-sidebar",
        display: "flex",
        time: 300,
        transition:
            {"transition ease-in-out duration-300 transform", "-translate-x-full", "translate-x-0"}
        )
        |> JS.hide(to: "#show-mobile-sidebar", transition: "fade-out")
        |> JS.dispatch("js:exec", to: "#hide-mobile-sidebar", detail: %{call: "focus", args: []})
  end

  def hide_mobile_sidebar(js \\ %JS{}) do
    js
    |> JS.hide(to: "#mobile-sidebar-container", transition: "fade-out")
    |> JS.hide(
      to: "#mobile-sidebar",
      time: 300,
      transition:
        {"transition ease-in-out duration-300 transform", "translate-x-0", "-translate-x-full"}
    )
    |> JS.show(to: "#show-mobile-sidebar", transition: "fade-in")
    |> JS.dispatch("js:exec", to: "#show-mobile-sidebar", detail: %{call: "focus", args: []})
  end
end