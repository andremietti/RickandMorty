//
//  CharacterCell.swift
//  RickandMorty
//
//  Created by andre mietti on 11/04/25.
//


import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    override var reuseIdentifier: String? {
        return "CharacterTableViewCell"
    }
    
    
    // MARK: Properties
    
    let rootView = CharacterView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    //MARK: - Setup
    
    func setupView() {
        addSubview(rootView)
        accessoryType = .disclosureIndicator
        selectionStyle = .none
        backgroundColor = .clear
        rootView.translatesAutoresizingMaskIntoConstraints = false
        rootView.layer.cornerRadius = 10.0
        setupConstraints()
    }

    func configureCell(character: Character) {
        rootView.setView(character: character)
    }

    private func setupConstraints() {
        
        rootView.constraint {[
            $0.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0),
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]}
    }

}
