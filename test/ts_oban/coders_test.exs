defmodule TsOban.CodersTest do
  use TsOban.DataCase

  alias TsOban.Coders

  describe "coders" do
    alias TsOban.Coders.Coder

    import TsOban.CodersFixtures

    @invalid_attrs %{name: nil, position: nil, email: nil}

    test "list_coders/0 returns all coders" do
      coder = coder_fixture()
      assert Coders.list_coders() == [coder]
    end

    test "get_coder!/1 returns the coder with given id" do
      coder = coder_fixture()
      assert Coders.get_coder!(coder.id) == coder
    end

    test "create_coder/1 with valid data creates a coder" do
      valid_attrs = %{name: "some name", position: "some position", email: "some email"}

      assert {:ok, %Coder{} = coder} = Coders.create_coder(valid_attrs)
      assert coder.name == "some name"
      assert coder.position == "some position"
      assert coder.email == "some email"
    end

    test "create_coder/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Coders.create_coder(@invalid_attrs)
    end

    test "update_coder/2 with valid data updates the coder" do
      coder = coder_fixture()
      update_attrs = %{name: "some updated name", position: "some updated position", email: "some updated email"}

      assert {:ok, %Coder{} = coder} = Coders.update_coder(coder, update_attrs)
      assert coder.name == "some updated name"
      assert coder.position == "some updated position"
      assert coder.email == "some updated email"
    end

    test "update_coder/2 with invalid data returns error changeset" do
      coder = coder_fixture()
      assert {:error, %Ecto.Changeset{}} = Coders.update_coder(coder, @invalid_attrs)
      assert coder == Coders.get_coder!(coder.id)
    end

    test "delete_coder/1 deletes the coder" do
      coder = coder_fixture()
      assert {:ok, %Coder{}} = Coders.delete_coder(coder)
      assert_raise Ecto.NoResultsError, fn -> Coders.get_coder!(coder.id) end
    end

    test "change_coder/1 returns a coder changeset" do
      coder = coder_fixture()
      assert %Ecto.Changeset{} = Coders.change_coder(coder)
    end
  end
end
