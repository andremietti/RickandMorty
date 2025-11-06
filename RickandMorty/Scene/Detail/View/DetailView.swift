//
//
//  DetailView.swift
//  RickandMorty
//
//  Created by andre mietti on 16/10/25.
//
//

import UIKit

public protocol DetailViewDelegate: AnyObject {}

class DetailView: SceneView {
    
    // MARK: - Properties
    public var delegate: DetailViewDelegate?
    private let containerView = configure(UIView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private var stackView = configure(UIStackView()) {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.spacing = 6.0
    }
    
    private var characterImageView = configure(UIImageView()) {
        $0.contentMode = .scaleAspectFit
        $0.layer.masksToBounds = true
    }
        
    private var dotDetailRowView = DotDataRowView()
    private var speciesDataView = DetailRowView()
    private var genderDataView = DetailRowView()
    private var typeDataView = DetailRowView()
    private var createdAtDataView = DetailRowView()
    
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
        containerView.addSubview(characterImageView)
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(dotDetailRowView)
        stackView.addArrangedSubview(speciesDataView)
        stackView.addArrangedSubview(genderDataView)
        stackView.addArrangedSubview(typeDataView)
        stackView.addArrangedSubview(createdAtDataView)
    }
    
    override func setupConstraints() {
        containerView.constraint {[
            $0.topAnchor.constraint(equalTo: topAnchor, constant: 0.0),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0.0)
        ]}

        characterImageView.constraint {[
            $0.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8.0),
            $0.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0.0),
            $0.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: 0.8),
            $0.heightAnchor.constraint(equalTo: containerView.widthAnchor, constant: 0.8)

        ]}
                
        stackView.constraint {[
            $0.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 8.0),
            $0.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8.0),
            $0.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0)
        ]}

    }
    
    func setView(character: Character) {
        setImage(imageUrl: character.image)
        speciesDataView.setView(title: DetailLocalize.species.rawValue, value: character.species, showSeparator: true)
        genderDataView.setView(title: DetailLocalize.gender.rawValue, value: character.gender, showSeparator: true)
        typeDataView.setView(title: DetailLocalize.characterType.rawValue, value: character.type == "" ? DetailLocalize.noType.rawValue : character.type, showSeparator: true)
        createdAtDataView.setView(title: DetailLocalize.created.rawValue, value: character.createdCharacter.defaultValue, showSeparator: true)
        dotDetailRowView.setView(name: character.name, status: character.status, showSeparator: true)
    }
    
    private func setImage(imageUrl: String) {
        characterImageView.kf.setImage(with: URL(string: imageUrl), placeholder: UIImage(named: "rickandmortyplaceholder"))
    }

}
