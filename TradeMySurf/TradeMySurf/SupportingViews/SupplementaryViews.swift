//
//  SectionHeader.swift


import UIKit

class BoardSupplementaryView: UICollectionReusableView {

    let title = UILabel()
    let subtitle = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Stop trying to make storyboards happen.")
    }
    
    func fillWith(_ data: Surfboard) {
        title.text = "Surfboard for: \(data.level)"
        subtitle.text = "Shapes and volume for your level"
    }
    
    func configureUI() {
        let separator = UIView(frame: .zero)
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .white

        title.textColor = .white
        title.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .bold))
        subtitle.textColor = .white

        let stackView = UIStackView(arrangedSubviews: [separator, title, subtitle])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        addSubview(stackView)
        
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true

        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        stackView.setCustomSpacing(10, after: separator)
    }
}

class LocationSupplementaryView: UICollectionReusableView {

    let title = UILabel()
    let subtitle = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Stop trying to make storyboards happen.")
    }
    
    func fillWith(_ data: Location) {
        title.text = "Surf loacation for:\(data.beaufortScaleWave)"
        subtitle.text = "Beaufort scale measure for wave height"
    }
    
    func configureUI() {
        let separator = UIView(frame: .zero)
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .white

        title.textColor = .white
        title.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .bold))
        subtitle.textColor = .white

        let stackView = UIStackView(arrangedSubviews: [separator, title, subtitle])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        addSubview(stackView)
        
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true

        stackView.setCustomSpacing(10, after: separator)
    }
}
