//
//  CharacterView.swift
//  RickandMorty
//
//  Created by andre mietti on 11/04/25.
//

import UIKit
import Kingfisher


enum StringStatus: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
}

extension UIColor {
    func getStatus(status: StringStatus) -> UIColor {
        switch status {
        case .alive:
            return .green
        case .dead:
            return .red
        case .unknown:
            return .orange
        }
    }
}


final class CharacterView: SceneView {
    
    //MARK: - Properties
    let characterImageView = configure(UIImageView()) {
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .lightGray
        $0.layer.masksToBounds = true
    }
    
    let dotStatusView = configure(UIView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 5
    }

    let characterNameLabel = configure(UILabel()) {
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 16.0)
    }
        
    let characterStatusLabel = configure(UILabel()) {
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.text = "Alive - Human"
    }
    
    let lastLocationLabel = configure(UILabel()) {
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.text = CharacterLocalize.lastKnownLocation.rawValue
    }

    let locationLabel = configure(UILabel()) {
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14)
    }

    let firstSeeInLabelLabel = configure(UILabel()) {
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.text = CharacterLocalize.firstSeenIn.rawValue
    }

    let seeInLabelLabel = configure(UILabel()) {
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.text = "Mortynight run"
    }

    
    //MARK: - Setup
    override func layoutSubviews() {
        characterImageView.roundCorners(corners: [.topLeft, .bottomLeft], radius: 10.0)
    }
    
    override func buildViewHierarchy() {
        backgroundColor = UIColor(red: 61.0/255.0, green: 62.0/255.0, blue: 68.0/255.0, alpha: 1.0)
        contentView.backgroundColor = .clear
        addSubview(characterImageView)
        addSubview(characterNameLabel)
        addSubview(characterStatusLabel)
        addSubview(dotStatusView)
        addSubview(lastLocationLabel)
        addSubview(locationLabel)
        addSubview(firstSeeInLabelLabel)
        addSubview(seeInLabelLabel)
        
        setupConstraints()
    }
    
    override func setupConstraints() {
        characterImageView.constraint {[
            $0.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            $0.widthAnchor.constraint(equalToConstant: 130.0),
            $0.heightAnchor.constraint(equalToConstant: 130.0),
        ]}
        
        characterNameLabel.constraint {[
            $0.topAnchor.constraint(equalTo: self.topAnchor, constant: 8.0),
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10.0),
            $0.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 10.0)
        ]}
        
        dotStatusView.constraint {[
            $0.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor, constant: 4.0),
            $0.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 10.0),
            $0.widthAnchor.constraint(equalToConstant: 10.0),
            $0.heightAnchor.constraint(equalToConstant: 10.0)
        ]}
        
        characterStatusLabel.constraint{[
            $0.centerYAnchor.constraint(equalTo: dotStatusView.centerYAnchor),
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10.0),
            $0.leadingAnchor.constraint(equalTo: dotStatusView.trailingAnchor, constant: 4.0)
        ]}
        
        lastLocationLabel.constraint {[
            $0.topAnchor.constraint(equalTo: characterStatusLabel.bottomAnchor, constant: 6.0),
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10.0),
            $0.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 10.0)
        ]}
        
        locationLabel.constraint {[
            $0.topAnchor.constraint(equalTo: lastLocationLabel.bottomAnchor, constant: 2.0),
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10.0),
            $0.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 10.0)
        ]}
        
        firstSeeInLabelLabel.constraint {[
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10.0),
            $0.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 10.0)
        ]}

        seeInLabelLabel.constraint {[
            $0.topAnchor.constraint(equalTo: firstSeeInLabelLabel.bottomAnchor, constant: 2.0),
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10.0),
            $0.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 10.0),
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8.0)
        ]}
    }
    
}


//MARK: - Functional Methods
extension CharacterView {
    
    func setView(character: Character) {
        characterNameLabel.text = character.name
        characterStatusLabel.text = character.status
        locationLabel.text = character.location.name
        seeInLabelLabel.text = character.origin.name
        
        setImage(imageUrl: character.image)
        setStatus(status: StringStatus(rawValue: character.status)?.rawValue ?? .defaultValue)
    }
    
    private func setImage(imageUrl: String) {
        characterImageView.kf.setImage(with: URL(string: imageUrl))
    }
    
    private func setStatus(status: String) {

        dotStatusView.backgroundColor = UIColor().getStatus(status: StringStatus(rawValue: status) ?? .unknown)
    }
}

