defmodule ChatApp.Talk do
  alias ChatApp.Repo
  alias ChatApp.Talk.Room

  def list_rooms do
    Repo.all(Room)
  end

  def create_room(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:rooms)
    |> Room.changeset(attrs)
    |> Repo.insert()
  end

  def get_room!(id), do: Repo.get(Room, id)

  def change_room(%Room{} = room) do
    Room.changeset(room, %{})
  end

  def update_room(%Room{} = room, attrs \\ %{}) do
    room
    |> Room.changeset(attrs)
    |> Repo.insert_or_update()
  end

  def delete_room(%Room{} = room) do
    Repo.delete(room)
  end
end
