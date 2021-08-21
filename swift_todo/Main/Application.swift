//
//  Application.swift
//  swift_todo
//
//  Created by tk84 on 2021/08/21.
//

import UIKit


class Application {

    static let shared = Application()
    private init() {}

    func configure(with window: UIWindow) {
        buildLayer()

        let todoIndexViewController = TodoIndexViewController()
        window.rootViewController = todoIndexViewController
    }

    private func buildLayer() {

    }

}
