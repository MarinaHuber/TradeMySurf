//
//  LoadingStateViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 12/4/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class LoadingStateViewController: UIViewController {

	var activityView: UIActivityIndicatorView?
	private let childView = UIView()

	override func viewDidLoad() {
		super.viewDidLoad()
		childView.frame = CGRect(x: 80, y: 100, width: 200, height: 100)
		childView.backgroundColor = UIColor.green
		view.addSubview(childView)
		showActivityIndicator()
	}

	func showActivityIndicator() {
		activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
		activityView?.center = self.view.center
		self.view.addSubview(activityView!)
		activityView?.startAnimating()
	}

	func hideActivityIndicator() {
		if (activityView != nil) {
			activityView?.stopAnimating()
		}
	}

}
