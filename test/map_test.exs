defmodule Prelude.Test.Map do
  use ExSpec, async: true
  doctest Prelude.Map

  defmodule Bla do
    defstruct a: %{}, b: 0
  end

  describe "deep_put" do
    describe "variation :map" do
      it "works with nested maps" do
        map = %{a: %{b: "b"}}
        r = Prelude.Map.deep_put(map, [:a, :b], "a")
        assert r.a.b == "a"
      end

      it "overrides deep values" do
        r = Prelude.Map.deep_put(%Bla{}, [:a, :b], "a")
        assert r.a.b == "a"
      end

      it "replaces current values: %{}" do
        map = %{a: %{b: %{}}}
        r = Prelude.Map.deep_put(map, [:a, :b], "yes!")
        assert r.a.b == "yes!"
      end

      it "replaces current values: []" do
        map = %{a: %{b: [] }}
        r = Prelude.Map.deep_put(map, [:a, :b], "yes!")
        assert r.a.b == "yes!"
      end

      it "replaces deeper values chain with provided plain value" do
        map = %{a: %{b: %{c: %{d: 1}}} }
        r = Prelude.Map.deep_put(map, [:a, :b], "yes!")
        assert r.a.b == "yes!"
      end
    end

    describe "variation :list" do
      it "adds values to present values as list" do
        map = %{a: %{b: ["nope"]}}
        r = Prelude.Map.deep_put(map, [:a, :b], "yes!", :list)
        assert r.a.b == ["yes!", "nope"]
      end

      it "current values, if they are not lists" do
        map = %{a: %{b: %{}}}
        r = Prelude.Map.deep_put(map, [:a, :b], "yes!", :list)
        assert r.a.b == ["yes!", %{}]
      end

      it "converts plain leaf values to lists" do
        map = %{a: %{b: "a"} }
        r = Prelude.Map.deep_put(map, [:a, :b], "b", :list)
        assert r.a.b == ["b", "a"]
      end

      it "works with structs" do
        r = Prelude.Map.deep_put(%Bla{}, [:a, :b], "yes!", :list)
        assert r.a.b == ["yes!"]
      end
    end
  end

  describe "deep_get" do
    it "works with maps" do
      assert %{a: %{b: %{c: 1}}}
        |> Prelude.Map.deep_get([:a, :b, :c]) == 1
    end

    it "works with nested structs" do
      map = %{a: %{a: %{b: 1}}}
      assert struct(Bla, map)
        |> Prelude.Map.deep_get([:a, :a, :b]) == 1
    end
  end

  describe "del_in" do
    it "works with nested structs" do
      a = struct(Bla, %{a: %{b: ["yes", "maybe"]}})
      refute a.a.b == nil
      r = Prelude.Map.del_in(a, [:a], :b)
      assert r.a[:b] == nil
    end
  end
end
