//
//  ViewController.swift
//  transitionUInavigationController
//
//  Created by Andrew Cheberyako on 23.07.2021.
//

import UIKit
import Cartography
import Photos

class DetailViewController: UIViewController {
    
    private let imageView = UIImageView()
    private let imageManager = PHCachingImageManager()
    
    init(image: UIImage) {

        super.init(nibName: nil, bundle: nil)

        self.imageView.contentMode = .scaleAspectFit
        self.imageView.backgroundColor = .white
        self.imageView.accessibilityIgnoresInvertColors = true
        self.view.backgroundColor = .white
        self.imageView.image = image

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Detail"

        self.view.addSubview(self.imageView)
        constrain(self.imageView) {
            $0.edges == $0.superview!.edges
        }
       
    }

}

extension DetailViewController: DetailTransitionAnimatorDelegate {
    func transitionWillStart() {
        self.imageView.isHidden = true
    }

    func transitionDidEnd() {
        self.imageView.isHidden = false
    }

    func referenceImage() -> UIImage? {
        return self.imageView.image
    }

    func imageFrame() -> CGRect? {
        let rect = CGRect.makeRect(aspectRatio: imageView.image!.size, insideRect: imageView.bounds)
        return rect
    }
}

public extension CGFloat {
    /// Returns the value, scaled-and-shifted to the targetRange.
    /// If no target range is provided, we assume the unit range (0, 1)
    static func scaleAndShift(
        value: CGFloat,
        inRange: (min: CGFloat, max: CGFloat),
        toRange: (min: CGFloat, max: CGFloat) = (min: 0.0, max: 1.0)
        ) -> CGFloat {
        assert(inRange.max > inRange.min)
        assert(toRange.max > toRange.min)

        if value < inRange.min {
            return toRange.min
        } else if value > inRange.max {
            return toRange.max
        } else {
            let ratio = (value - inRange.min) / (inRange.max - inRange.min)
            return toRange.min + ratio * (toRange.max - toRange.min)
        }
    }
}

public extension CGSize {
    /// Scales up a point-size CGSize into its pixel representation.
    var pixelSize: CGSize {
        let scale = UIScreen.main.scale
        return CGSize(width: self.width * scale, height: self.height * scale)
    }
}

public extension CGRect {
    /// Kinda like AVFoundation.AVMakeRect, but handles tall-skinny aspect ratios differently.
    /// Returns a rectangle of the same aspect ratio, but scaleAspectFit inside the other rectangle.
    static func makeRect(aspectRatio: CGSize, insideRect rect: CGRect) -> CGRect {
        let viewRatio = rect.width / rect.height
        let imageRatio = aspectRatio.width / aspectRatio.height
        let touchesHorizontalSides = (imageRatio > viewRatio)

        let result: CGRect
        if touchesHorizontalSides {
            let height = rect.width / imageRatio
            let yPoint = rect.minY + (rect.height - height) / 2
            result = CGRect(x: 0, y: yPoint, width: rect.width, height: height)
        } else {
            let width = rect.height * imageRatio
            let xPoint = rect.minX + (rect.width - width) / 2
            result = CGRect(x: xPoint, y: 0, width: width, height: rect.height)
        }
        return result
    }
}

