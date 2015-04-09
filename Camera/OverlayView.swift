//
//  OverlayView.swift
//  Camera
//
//  Created by Matt Larkin on 4/8/15.
//  Copyright (c) 2015 Matt Larkin. All rights reserved.
//

import UIKit

class OverlayView: UIView {

    var view: UIView!

    var nibName: String = "OverlayView"

     // init

    override init(frame: CGRect) {
        // properties
        super.init(frame: frame)

        // Set anything that uses the view or visible bounds
        setup()
    }

    required init(coder aDecoder: NSCoder) {
        // properties
        super.init(coder: aDecoder)

        // Setup
        setup()
    }

    func setup() {
        view = loadViewFromNib()

        view.frame = bounds
        view.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight

        addSubview(view)
    }

    func loadViewFromNib() -> UIView {

        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView

        return view
    }



}
