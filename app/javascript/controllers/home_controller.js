import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["userList"];

  toggleUserList() {
    this.userListTarget.classList.toggle("hidden");
  }
}
