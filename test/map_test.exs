defmodule Prelude.Test.Map do
  use ExSpec, async: true
  doctest Prelude.Map

  defmodule Bla do
    defstruct assigns: %{}, id: 0
  end

  describe "deep_put" do
    it "works with nested maps" do
      r = Prelude.Map.deep_put(%{assigns: %{works: "nope"}}, [:assigns, :works], "yes!")
      assert r.assigns[:works] == "yes!"
    end

    it "maps: overrides deep values" do
      r = Prelude.Map.deep_put(%Bla{}, [:assigns, :works], "yes!")
      assert r.assigns[:works] == "yes!"
    end
  end

  describe "deep_put_list" do
    it "works with nested maps" do
      map = %{assigns: %{works: "nope"}}
      r = Prelude.Map.deep_put_list(map, [:assigns, :works], "yes!")
      assert r.assigns[:works] == ["yes!", "nope"]
    end

    it "maps: overrides deep values" do
      struct = %Bla{}
      r = Prelude.Map.deep_put_list(struct, [:assigns, :works], ["yes!"])
      assert r.assigns[:works] == ["yes!"]
    end
  end

  describe "deep_get" do
    it "works with maps" do
      assert %{a: %{b: %{c: 1}}}
        |> Prelude.Map.deep_get([:a, :b, :c]) == 1
    end

    it "works with nested structs" do
      map = %{assigns: %{a: %{b: 1}}}
      assert struct(Bla, map)
        |> Prelude.Map.deep_get([:assigns, :a, :b]) == 1
    end
  end

  describe "del_in" do
    it "works with nested structs" do
      a = struct(Bla, %{assigns: %{works: ["yes", "maybe"]}})
      refute a.assigns[:works] == nil
      r = Prelude.Map.del_in(a, [:assigns], :works)
      assert r.assigns[:works] == nil
    end
  end
end
