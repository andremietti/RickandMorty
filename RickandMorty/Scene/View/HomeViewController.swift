//
//  
//  HomeViewController.swift
//  RickandMorty
//
//  Created by andre mietti on 10/04/25.
//
//
import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Metrics
    /*
     private enum Metrics {
         enum Label {
            static let top: CGFloat = 24.0
         }
     }
     **/
    
    // MARK: - Properties
    private let rootView = HomeView()
    private let viewModel: HomeViewModelProtocol

    // MARK: - ViewConreoller LifeCycle
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.delegate = self
    }

    // MARK: - Setup
    private func setupBinds() {}

}

// MARK: - HomeViewDelegate
extension HomeViewController: HomeViewDelegate {}
