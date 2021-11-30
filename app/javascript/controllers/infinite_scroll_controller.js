import {Controller} from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
    static targets = ["entries", "pagination"]

    initialize() {
        let options = {
            rootMargin: '0px',
            threshold: 1.0
        }

        this.intersectionObserver = new IntersectionObserver(entries => this.processIntersectionEntries(entries), options)
    }

    connect() {
        this.intersectionObserver.observe(this.paginationTarget)
        console.log(this.paginationTarget)
        console.log(document.body)

    }

    disconnect() {
        this.intersectionObserver.unobserve(this.paginationTarget)
    }

    processIntersectionEntries(entries) {
        var intersectingCount = 0;
        var count = 0;
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                intersectingCount += 1
                this.loadMore()
            }
        })
        console.log("Intersecting count: " + intersectingCount)
    }

    loadMore() {
        let next_page = this.paginationTarget.querySelector("a[rel='next']")
        if (next_page == null) {
            return
        }
        let url = next_page.href

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
