import UIKit

class HeaderView: UIView {
    static let ClearNotificationName  = "ClearNotificationName"
    static let ButtonSize = CGFloat(50.0)

    lazy var clearButton: UIButton = {
        let image = UIImage(named: "clear")!
        let button = UIButton(type: .Custom)
        button.setImage(image, forState: .Normal)
        button.addTarget(self, action: "clearAction:", forControlEvents: .TouchUpInside)

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(self.clearButton)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.clearButton.frame = CGRect(x: 0, y: 0, width: HeaderView.ButtonSize, height: HeaderView.ButtonSize)
    }

    func clearAction(button: UIButton) {
        NSNotificationCenter.defaultCenter().postNotificationName(HeaderView.ClearNotificationName, object: button)
    }
}