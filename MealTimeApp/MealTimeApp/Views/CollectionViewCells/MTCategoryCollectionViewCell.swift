//
//  MTCategoryCollectionViewCell.swift
//  MealTimeApp
//
//  Created by Jason Pinlac on 12/12/21.
//

import UIKit

class MTCategoryCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: MTCategoryCollectionViewCell.self)
    
    let imageService = MTImageService()
    var currentTask: Cancellable?
    
    let categoryThumbnailImageView = MTThumbnailImageView()
    let categoryBodyLabel = MTBodyLabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // this set method sets sets the category name to the the label and also invokes a network call to download the thumbnail data and set it.
    // Also, we set the dataTask reference to a stored property on the cell called currentDataTask. This is to hold a reference to the last network call invoked.
    // reason being is because we dont want a user wasting their data on network calls that run async in the background
    // we simply just cancel any previous network calls using the URLSession.shared.dataTask() instance returned in the prepareForReuse method below.
    // this makes sense because as we scroll, call the cellForRowItemAt, dequeue a cell, and set the thumbnail URLString for the network call to hit the API
    // we don't care about any previous network calls to get the image thumbnail data. We only want the most recent thumbnail image from the most recent network request.
    // So, we keep track of the previous dataTask doing the network call, stop it and track the new dataTask.
    func set(_ category: MTCategory) {
        self.categoryBodyLabel.text = category.name
        self.currentTask = imageService.getThumbnail(from: category.thumbnailURL) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success( let thumbnailImage ):
                DispatchQueue.main.async { self.categoryThumbnailImageView.image = thumbnailImage }
            case .failure(_):
                return
            }
        }
    }
    
    
    func resetToPlaceholderState() {
        self.categoryThumbnailImageView.image = MTSymbol.forkKnifePlaceholder.image
        self.categoryBodyLabel.text = "Placeholder"
    }
    
    
    // This function is called within cellForRow/Item at. Its responsibility is to cancel the previous network call/dataTask to get the thumbnail image data.
    func cancelThumbnailImageRequest() {
        self.currentTask?.cancel()
    }
    
    
    // this prepareForReuse is important on fixing that image glitch when scrolling fast on a slow connection.
    // Because getting the images is from an async call we dont know the exact timeing...
    // this can cause images to populate the imageView on the cell slow or flaky and this means that the image from the last cell dequeue could still be there and not be in sync with other information on the cell set IE the label.
    // So, we prepare the cell for reuse by canceling the previous async datatask to get the thumbnail data as we scroll cells off the screen and get ready to dequeue them.
    // This ensures ONLY the very last network dataTask call to get the thumbnail is not canceled and will set when done. Every other previous async call made will cancel as we scroll off, prepare, and dequeue reusable cells.
    //  override func prepareForReuse() {
    //    super.prepareForReuse()
    //    self.currentDataTask?.cancel()
    //  }
    
    
    private func configureLayout() {
        self.contentView.addSubview(categoryThumbnailImageView)
        self.contentView.addSubview(categoryBodyLabel)
        NSLayoutConstraint.activate([
            categoryThumbnailImageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            categoryThumbnailImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            categoryThumbnailImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            categoryThumbnailImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            categoryBodyLabel.bottomAnchor.constraint(equalTo: categoryThumbnailImageView.bottomAnchor),
            categoryBodyLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.15),
            categoryBodyLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            categoryBodyLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
        ])
    }
    
}
