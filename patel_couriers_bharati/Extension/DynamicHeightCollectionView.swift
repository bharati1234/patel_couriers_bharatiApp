//
//  DynamicHeightCollectionView.swift
//  DynamicHeightCollectionView
//
//  Created by Swapnil Dhavan on 11/02/19.
//  Copyright © 2019 Swapnil Dhavan. All rights reserved.
//

import UIKit

class DynamicHeightCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}
