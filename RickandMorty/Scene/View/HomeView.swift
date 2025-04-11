//
//  
//  HomeView.swift
//  RickandMorty
//
//  Created by andre mietti on 10/04/25.
//
//

import UIKit

public protocol HomeViewDelegate: AnyObject {}

class HomeView: SceneView {

    // MARK: - Properties
    public var delegate: HomeViewDelegate?
    private let containerView = configure(UIView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - setup
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func buildViewHierarchy() {
        addSubview(containerView)
    }

    override func setupConstraints() {}
}
