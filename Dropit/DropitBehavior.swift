//
//  DropitBehavior.swift
//  Dropit
//
//  Created by Екатерина Колесникова on 22.03.15.
//  Copyright (c) 2015 kkate. All rights reserved.
//

import UIKit

class DropitBehavior: UIDynamicBehavior
{
    let gravity = UIGravityBehavior()

    lazy var collider: UICollisionBehavior = {
        let lazilyCreatedCollider = UICollisionBehavior()
        lazilyCreatedCollider.translatesReferenceBoundsIntoBoundary = true
        return lazilyCreatedCollider
    }()

    lazy var dropBehavior: UIDynamicItemBehavior = {
        let lazilyCreatedDropBehavior = UIDynamicItemBehavior()
        lazilyCreatedDropBehavior.allowsRotation = false
        lazilyCreatedDropBehavior.elasticity = 0.75
        return lazilyCreatedDropBehavior
    }()

    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(dropBehavior)
    }

    func addDrop(dropView: UIView) {
        dynamicAnimator?.referenceView?.addSubview(dropView)
        gravity.addItem(dropView)
        collider.addItem(dropView)
        dropBehavior.addItem(dropView)
    }

    func removeDrop(dropView: UIView) {
        gravity.removeItem(dropView)
        collider.removeItem(dropView)
        dropBehavior.removeItem(dropView)
        dropView.removeFromSuperview()
    }
}
