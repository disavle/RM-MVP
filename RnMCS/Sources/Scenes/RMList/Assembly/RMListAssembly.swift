//
//  RMListAssembly.swift
//  Prex
//
//  Created by Savelev Dmitriy on 17.01.2023.
//

import UIKit

final class RMListAssembly {

	private let networkAssembly: NetworkAssembly

	init(networkAssembly: NetworkAssembly) {
		self.networkAssembly = networkAssembly
	}

	func assembly() -> UIViewController {
		let requestProcessor = networkAssembly.requestProcessor
		let router = RMListRouter()
		let RMListService = RMListService(requestProcessor: requestProcessor)
		let presenter = RMListPresenter(
			router: router,
			RMListService: RMListService
		)
		let view = RMListViewController(presenter: presenter)
		router.view = view
		presenter.view = view
		return view
	}
}
