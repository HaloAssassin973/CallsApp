//
//  TableViewController.swift
//  CallsApp
//
//  Created by Игорь Силаев on 08.11.2020.
//

import UIKit

final class TableViewController: UIViewController {

    // MARK: - Properties

    private let tableView = UITableView()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    // MARK: - Private

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false

        tableView.register(CallTableViewCell.self, forCellReuseIdentifier: Constants.cellReuseId)
        tableView.separatorStyle = .none

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = Constants.rowHeight

        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }

}

// MARK: - UITableViewDelegate

extension TableViewController: UITableViewDelegate {

}

// MARK: - UITableViewDataSource

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.cellsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReuseId, for: indexPath) as? CallTableViewCell else { return UITableViewCell() }

        return cell
    }
}

// MARK: - Constants

private extension TableViewController {
    enum Constants {
        static let cellReuseId = "CallCell"
        static let cellsCount = 4
        static let rowHeight: CGFloat = 96
    }
}
