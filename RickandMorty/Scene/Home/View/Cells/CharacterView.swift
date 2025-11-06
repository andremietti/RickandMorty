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

final class CharacterView: SceneView {
    
    //MARK: - Properties
    private let characterImageView = configure(UIImageView()) {
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .lightGray
        $0.layer.masksToBounds = true
    }
        
    private var stackView = configure(UIStackView()) {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 4.0
    }

    private let lastLocationCharacterDataView = CharacterDataRowView()
    private let firstLocationCharacterDataView = CharacterDataRowView()
    private let dotDataRowView = DotDataRowView()
    
    //MARK: - Setup
    override func layoutSubviews() {
        characterImageView.roundCorners(corners: [.topLeft, .bottomLeft], radius: 10.0)
    }
    
    override func buildViewHierarchy() {
        backgroundColor = UIColor(red: 61.0/255.0, green: 62.0/255.0, blue: 68.0/255.0, alpha: 1.0)
        contentView.backgroundColor = .clear
        addSubview(characterImageView)
        addSubview(stackView)
        stackView.addArrangedSubview(dotDataRowView)
        stackView.addArrangedSubview(lastLocationCharacterDataView)
        stackView.addArrangedSubview(firstLocationCharacterDataView)

        setupConstraints()
    }
    
    override func setupConstraints() {
        characterImageView.constraint {[
            $0.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            $0.widthAnchor.constraint(equalToConstant: 130.0),
            $0.heightAnchor.constraint(equalToConstant: 130.0),
        ]}
                        
        stackView.constraint {[
            $0.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
            $0.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 10.0),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10.0),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4.0)
        ]}
    }
    
}


//MARK: - Functional Methods
extension CharacterView {
    
    func setView(character: Character) {
        lastLocationCharacterDataView.setView(title: CharacterLocalize.lastKnownLocation.rawValue, value: character.location.name, showSeparator: false)
        firstLocationCharacterDataView.setView(title: CharacterLocalize.firstSeenIn.rawValue, value: character.origin.name, showSeparator: false)
        setImage(imageUrl: character.image)
        dotDataRowView.setView(name: character.name, status: character.status, showSeparator: false)
    }
    
    private func setImage(imageUrl: String) {
        characterImageView.kf.setImage(with: URL(string: imageUrl), placeholder: UIImage(named: "rickandmortyplaceholder"))
    }
    
}

