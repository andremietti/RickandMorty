//
//  DotDataRowView.swift
//  RickandMorty
//
//  Created by andre mietti on 20/10/25.
//

import UIKit

final class DotDataRowView: SceneView {
    
    private var stackView = configure(UIStackView()) {
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
        $0.spacing = 8
    }

    private let characterNameLabel = configure(UILabel()) {
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 16.0)
    }

    let dotStatusView = configure(UIView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 5
    }
    
    let characterStatusLabel = configure(UILabel()) {
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.setContentHuggingPriority(.defaultLow, for: .horizontal)
        $0.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
    
    private var separatorView = configure(UIView()) {
        $0.backgroundColor = .darkGray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func buildViewHierarchy() {
        addSubview(characterNameLabel)
        addSubview(stackView)
        stackView.addArrangedSubview(dotStatusView)
        stackView.addArrangedSubview(characterStatusLabel)
        addSubview(separatorView)
    }
    
    override func setupConstraints() {
        
        characterNameLabel.constraint {[
            $0.topAnchor.constraint(equalTo: topAnchor, constant: 0.0),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0)
        ]}
        
        stackView.constraint {[
            $0.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor, constant: 6.0),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0)
        ]}
        
        dotStatusView.constraint {[
            $0.widthAnchor.constraint(equalToConstant: 10.0),
            $0.heightAnchor.constraint(equalToConstant: 10.0)
        ]}
        
        separatorView.constraint {[
            $0.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8.0),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0.0),
            $0.heightAnchor.constraint(equalToConstant: 1.0)
        ]}
    }
    
    func setView(name: String, status: String, showSeparator: Bool) {
        characterNameLabel.text = name
        characterStatusLabel.text = status.capitalized
        separatorView.isHidden = !showSeparator
        setStatus(status: status)
    }
    
    private func setStatus(status: String) {
        dotStatusView.backgroundColor = UIColor().getStatus(status: StringStatus(rawValue: status) ?? .unknown)
    }
    
}
