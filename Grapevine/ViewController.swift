import UIKit

class ViewController: UIViewController {
  
  @IBOutlet private weak var iconImageView: UIImageView!
  @IBOutlet private weak var appNameLabel: UILabel!
  @IBOutlet private weak var skipButton: UIButton!
  @IBOutlet private weak var appImageView: UIImageView!
  @IBOutlet private weak var welcomeLabel: UILabel!
  @IBOutlet private weak var summaryLabel: UILabel!
  @IBOutlet private weak var pageControl: UIPageControl!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let views: [String: Any] = [
      "iconImageView": iconImageView,
      "appNameLabel": appNameLabel,
      "skipButton": skipButton,
      "appImageView": appImageView,
      "welcomeLabel": welcomeLabel,
      "summaryLabel": summaryLabel,
      "pageControl": pageControl]
    
    
    var allConstraints: [NSLayoutConstraint] = []
    
    let iconVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:|-20-[iconImageView(30)]",
      metrics: nil,
      views: views)
    allConstraints += iconVerticalConstraints
    
    /*
    let nameLabelVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:|-23-[appNameLabel]",
      metrics: nil,
      views: views)
    allConstraints += nameLabelVerticalConstraints
    
    let skipButtonVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:|-20-[skipButton]",
      metrics: nil,
      views: views)
    allConstraints += skipButtonVerticalConstraints
 */
    
    let topRowHorizontalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-15-[iconImageView(30)]-[appNameLabel]-[skipButton]-15-|",
      options: [.alignAllCenterY], // works for all elements because icon is set above
      metrics: nil,
      views: views)
    allConstraints += topRowHorizontalConstraints
    
    let summaryHorizontalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-15-[summaryLabel]-15-|",
      metrics: nil,
      views: views)
    allConstraints += summaryHorizontalConstraints
    
    let welcomeHorizontalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-15-[welcomeLabel]-15-|",
      metrics: nil,
      views: views)
    allConstraints += welcomeHorizontalConstraints
    
    let iconToImageVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:[iconImageView]-10-[appImageView]",
      metrics: nil,
      views: views)
    allConstraints += iconToImageVerticalConstraints
    
    let imageToWelcomeVerticalConstraint = NSLayoutConstraint.constraints(
      withVisualFormat: "V:[appImageView]-10-[welcomeLabel]",
      metrics: nil,
      views: views)
    allConstraints += imageToWelcomeVerticalConstraint
    
    let summaryLabelVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:[welcomeLabel]-4-[summaryLabel]",
      metrics: nil,
      views: views)
    allConstraints += summaryLabelVerticalConstraints
    
    let summaryToPageControlVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:[summaryLabel]-15-[pageControl(9)]-15-|",
      metrics: nil,
      views: views)
    allConstraints += summaryToPageControlVerticalConstraints
    
    let pageControlHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|-[pageControl]-|", metrics: nil, views: views)
    allConstraints += pageControlHorizontalConstraints
    
    
    NSLayoutConstraint.activate(allConstraints)
  }
  
  
  
  
  // H:|-[icon(==iconDate)]-20-[iconLabel(120@250)]-20@750-[iconDate(>=50)]-|
  
}
