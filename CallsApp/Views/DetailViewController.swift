//
//  DetailViewController.swift
//  CallsApp
//
//  Created by Игорь Силаев on 08.11.2020.
//

import UIKit

final class DetailViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var businessNameLabel: UILabel!
    @IBOutlet weak var businessPhoneNumberLabel: UILabel!

    private let viewModel = CallViewModel()

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchCall { [weak self] data in
            guard let self = self,
                  let data = data
            else { return }
            
            self.durationLabel.text = data.duration
            self.nameLabel.text = data.client.name
            self.phoneNumberLabel.text = data.client.address
            self.businessNameLabel.text = data.businessNumber.label
            self.businessPhoneNumberLabel.text = data.businessNumber.number
        }
    }
}
