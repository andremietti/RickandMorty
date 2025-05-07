//
//  
//  HomeView.swift
//  RickandMorty
//
//  Created by andre mietti on 10/04/25.
//
//

import Foundation
import UIKit
import Combine

public protocol HomeViewDelegate: AnyObject {
    func refreshTable()
    func loadMoreData()
}

class HomeView: SceneView {

    // MARK: - Properties
    @Published private var characters: Characters?
    private var cancellables = Set<AnyCancellable>()

    public var delegate: HomeViewDelegate?
    private let cellIdentifier = CharacterTableViewCell().reuseIdentifier
    var isLoading = false
    private var loadTimer: Timer?

    private let containerView = configure(UIView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    private var refreshControl = configure(UIRefreshControl()) {
        $0.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        $0.tintColor = .white
    }

    private lazy var homeTableView = configure(UITableView()) {
        $0.register(CharacterTableViewCell.self, forCellReuseIdentifier: cellIdentifier.defaultValue)
        $0.delegate = self
        $0.dataSource = self
        $0.showsVerticalScrollIndicator = false
        $0.separatorInset = .zero
        $0.frame = self.frame
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 140.0
        $0.tableFooterView = UIView()
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.addSubview(refreshControl)
    }
    
    
    // MARK: - setup
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func buildViewHierarchy() {
        addSubview(containerView)
        addSubview(self.homeTableView)
    }

    override func setupConstraints() {
        containerView.constraint {[
            $0.topAnchor.constraint(equalTo: self.topAnchor),
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ]}
                
        homeTableView.constraint {[
            $0.topAnchor.constraint(equalTo: self.topAnchor),
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]}

    }
    
}


//MARK: - Functional methods
extension HomeView {

    func setTableView(characters: Characters?) {
        self.characters = characters
        homeTableView.reloadData()
        isLoading = false
    }

    @objc func refresh(_ sender: AnyObject) {
        delegate?.refreshTable()
    }
    
    func endRefresh() {
        refreshControl.endRefreshing()
    }

}


//MARK: - UITableViewDelegate
extension HomeView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //            delegate?.didTapOnCharacter...
    }
}


//MARK: - UITableViewDataSource
extension HomeView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters?.count ?? .defaultValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier.defaultValue) as? CharacterTableViewCell else {
            return CharacterTableViewCell()
        }
        
        guard let charactersArray = characters else {
            return UITableViewCell()
        }

        cell.configureCell(character: charactersArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    
}


//MARK: - UIScrollViewDelegate
extension HomeView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.size.height {
            loadTimer?.invalidate()
            loadTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
                self.delegate?.loadMoreData()
            }
        }
    }
    
}

