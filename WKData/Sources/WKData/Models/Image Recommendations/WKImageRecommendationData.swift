import Foundation

public struct WKImageRecommendationData {
    public let pageId: Int
    public let image: String
    public let filename: String
    public let thumbUrl: String
    public let fullUrl: String
    public let description: String?
    public let descriptionUrl: String?

    public init(pageId: Int, image: String, filename: String, thumbUrl: String, fullUrl: String, description: String?, descriptionUrl: String?) {
        self.pageId = pageId
        self.image = image
        self.filename = filename
        self.thumbUrl = thumbUrl
        self.fullUrl = fullUrl
        self.description = description
        self.descriptionUrl = descriptionUrl
    }
}
