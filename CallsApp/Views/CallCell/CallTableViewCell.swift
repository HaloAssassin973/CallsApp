//
//  CallTableViewCell.swift
//  CallsApp
//
//  Created by Игорь Силаев on 08.11.2020.
//

import UIKit

final class CallTableViewCell: UITableViewCell {

    // MARK: - Properties

    private var icon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "call inbound missedicon"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var durationLabel: UILabel = {
        let label = UILabel()
        label.text = "00:59"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    private var businessNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Tags"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    private var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "+1 800 123-4567"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "10:21 AM"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    private var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 8
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        return view
    }()
    

    // MARK: - Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private

    private func setupCell() {
        addSubview(backView)
        backView.addSubview(icon)
        backView.addSubview(businessNameLabel)
        backView.addSubview(phoneNumberLabel)
        backView.addSubview(durationLabel)
        backView.addSubview(dateLabel)

        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),

            icon.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            icon.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            icon.heightAnchor.constraint(equalToConstant: 40),
            icon.widthAnchor.constraint(equalToConstant: 40),

            businessNameLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 15),
            businessNameLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 15),

            phoneNumberLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 15),
            phoneNumberLabel.topAnchor.constraint(equalTo: businessNameLabel.bottomAnchor, constant: 4),

            durationLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 8),
            durationLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16),
            durationLabel.centerXAnchor.constraint(equalTo: icon.centerXAnchor),

            dateLabel.centerYAnchor.constraint(equalTo: durationLabel.centerYAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16)
        ])
    }
}
