package webcrawlers

type Image struct {
	name string
	url  string
}
type Page string

type WebCrawler interface {
	get_images() ([]Image, error)
	download_image(Image, string) error
	discovery_pages() ([]Page, error)
}
