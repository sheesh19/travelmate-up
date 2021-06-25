import Rails from '@rails/ujs';
import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ["entries", "pagination"]

    scroll() {
        let next_page = this.paginationTarget.querySelector("a[rel='next']")
        if (next_page == null) { return }

        let url = next_page.href

        let body = document.body,
            html = document.documentElement

        let height = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight)

        if (window.pageYOffset >= (height - window.innerHeight) - 160) {
            this.loadMore(url)
        }
    }

    loadMore(url) {
        console.log(url)
        Rails.ajax({
            type: 'GET',
            url: url,
            dataType: 'json',
            success: (data) => {
                this.entriesTarget.insertAdjacentHTML('beforeend', data.entries)
                this.paginationTarget.innerHTML = data.pagination
            }
        })
    }

}