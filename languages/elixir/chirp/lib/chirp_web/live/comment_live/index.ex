defmodule ChirpWeb.CommentLive.Index do
  use ChirpWeb, :live_view

  alias Chirp.Post
  alias Chirp.Post.Comment

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :comments, list_comments())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Comment")
    |> assign(:comment, Post.get_comment!(id))
  end

  defp apply_action(socket, :new, %{"post_id" => post_id}) do
    socket
    |> assign(:page_title, "New Comment")
    |> assign(:post_id, post_id)
    |> assign(:comment, %Comment{})
  end

  defp apply_action(socket, :index, %{"post_id" => post_id}) do
    socket
    |> assign(:page_title, "Listing Comments")
    |> assign(:post_id, post_id)
    |> assign(:comment, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    comment = Post.get_comment!(id)
    {:ok, _} = Post.delete_comment(comment)

    {:noreply, assign(socket, :comments, list_comments())}
  end

  defp list_comments do
    Post.list_comments()
  end
end
