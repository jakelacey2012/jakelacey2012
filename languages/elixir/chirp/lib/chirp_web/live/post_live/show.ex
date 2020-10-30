defmodule ChirpWeb.PostLive.Show do
  use ChirpWeb, :live_view

  alias Chirp.TimeLine
  alias Chirp.Post
  alias Chirp.Post.Comment

  require Logger

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:comment, %Comment{post_id: id})
     |> assign(:post, TimeLine.get_post!(id))}
  end

  @impl true
  def handle_event("delete", %{"id" => id, "comment-id" => comment_id}, socket) do
    post = Post.get_comment!(comment_id)
    {:ok, _} = Post.delete_comment(post)

    {:noreply, assign(socket, :post, TimeLine.get_post!(id))}
  end

  defp page_title(:show), do: "Show Post"
  defp page_title(:new), do: "Add Comment"
  defp page_title(:edit), do: "Edit Post"
end
