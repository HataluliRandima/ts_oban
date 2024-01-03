defmodule TsOban.SuperheroTest do
  use TsOban.DataCase

  alias TsOban.Superhero

  describe "superheroes" do
    alias TsOban.Superhero.Superheroes

    import TsOban.SuperheroFixtures

    @invalid_attrs %{name: nil, power: nil, country: nil}

    test "list_superheroes/0 returns all superheroes" do
      superheroes = superheroes_fixture()
      assert Superhero.list_superheroes() == [superheroes]
    end

    test "get_superheroes!/1 returns the superheroes with given id" do
      superheroes = superheroes_fixture()
      assert Superhero.get_superheroes!(superheroes.id) == superheroes
    end

    test "create_superheroes/1 with valid data creates a superheroes" do
      valid_attrs = %{name: "some name", power: "some power", country: "some country"}

      assert {:ok, %Superheroes{} = superheroes} = Superhero.create_superheroes(valid_attrs)
      assert superheroes.name == "some name"
      assert superheroes.power == "some power"
      assert superheroes.country == "some country"
    end

    test "create_superheroes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Superhero.create_superheroes(@invalid_attrs)
    end

    test "update_superheroes/2 with valid data updates the superheroes" do
      superheroes = superheroes_fixture()
      update_attrs = %{name: "some updated name", power: "some updated power", country: "some updated country"}

      assert {:ok, %Superheroes{} = superheroes} = Superhero.update_superheroes(superheroes, update_attrs)
      assert superheroes.name == "some updated name"
      assert superheroes.power == "some updated power"
      assert superheroes.country == "some updated country"
    end

    test "update_superheroes/2 with invalid data returns error changeset" do
      superheroes = superheroes_fixture()
      assert {:error, %Ecto.Changeset{}} = Superhero.update_superheroes(superheroes, @invalid_attrs)
      assert superheroes == Superhero.get_superheroes!(superheroes.id)
    end

    test "delete_superheroes/1 deletes the superheroes" do
      superheroes = superheroes_fixture()
      assert {:ok, %Superheroes{}} = Superhero.delete_superheroes(superheroes)
      assert_raise Ecto.NoResultsError, fn -> Superhero.get_superheroes!(superheroes.id) end
    end

    test "change_superheroes/1 returns a superheroes changeset" do
      superheroes = superheroes_fixture()
      assert %Ecto.Changeset{} = Superhero.change_superheroes(superheroes)
    end
  end
end
