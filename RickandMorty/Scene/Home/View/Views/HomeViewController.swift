//
//  
//  HomeViewController.swift
//  RickandMorty
//
//  Created by andre mietti on 10/04/25.
//
//

import Foundation
import UIKit
import Combine

class HomeViewController: UIViewController {
        
    // MARK: - Properties
    private let rootView = HomeView()
    weak var coordinator: MainCoordinator?
    private var viewModel: HomeViewModel!
    
    @Published private var characters: Characters?
    private var cancellables = Set<AnyCancellable>()

    private var isLoading = false


    // MARK: - ViewConreoller LifeCycle
    init(viewModel: HomeViewModel = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        self.addSceneViewToSafeArea(rootView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.delegate = self
        self.view.backgroundColor = UIColor(red: 40.0/255.0, green: 43.0/255.0, blue: 50.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.backgroundColor = .white
        
        self.navigationController?.navigationBar.topItem?.title = "The Rick and Morty"
        
        setupObservables()
        loadData()
    }

}


// MARK: - Functional methods
extension HomeViewController {

    // MARK: - Setup
    func setupObservables() {
        viewModel.$characters
            .sink { results in
                self.characters = results
                self.rootView.setTableView(characters: self.characters)
                self.toggleLoader()
            }
            .store(in: &cancellables)
    }
    
    //MARK: - Fetch data
    func loadData() {
        viewModel.fecthCharacters()
    }
    
    //MARK: - Periferal
    func toggleLoader() {
        isLoading = !(characters?.count ?? .defaultValue > 0)
        if !isLoading {
            rootView.endRefresh()
        }
    }
}


// MARK: - HomeViewDelegate
extension HomeViewController: HomeViewDelegate {
    func refreshTable() {
        loadData()
    }
    
    func loadMoreData() {
        viewModel.loadMoreContent()
    }
}
