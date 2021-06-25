import Rails from '@rails/ujs';
import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ['entries', 'pagination'];

    initialize() {
        this.loading = false;
    }

    scroll() {
        const nextPage = this.paginationTarget.querySelector("a[rel='next']");

        if (nextPage == null) return;

        const url = nextPage.href;
        const body = document.body,
            html = document.documentElement;
        const height = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight);

        if (window.pageYOffset >= height - window.innerHeight - 200) {
            if (this.loading) return;

            this.loadMore(url);
        }
    }

    loadMore(url) {
        this.loading = true;

        Rails.ajax({
            type: 'GET',
            url,
            dataType: 'json',
            success: data => {
                this.entriesTarget.insertAdjacentHTML('beforeend', data.entries);
                this.paginationTarget.innerHTML = data.pagination;
                this.loading = false;
            }
        });
    }
}