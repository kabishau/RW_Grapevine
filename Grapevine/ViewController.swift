import UIKit

class ViewController: UIViewController {
  
  private enum Metrics {
    static let padding: CGFloat = 15.0
    static let iconImageViewWidth = 30.0
  }
  
  @IBOutlet private weak var iconImageView: UIImageView!
  @IBOutlet private weak var appNameLabel: UILabel!
  @IBOutlet private weak var skipButton: UIButton!
  @IBOutlet private weak var appImageView: UIImageView!
  @IBOutlet private weak var welcomeLabel: UILabel!
  @IBOutlet private weak var summaryLabel: UILabel!
  @IBOutlet private weak var pageControl: UIPageControl!
  
  // viewDidLoad is not gonna work because iPhone X changes safe area during rotation, so constraints should be recalculated
  private var allConstraints: [NSLayoutConstraint] = []
  
  override func viewSafeAreaInsetsDidChange() {
    super.viewSafeAreaInsetsDidChange()
    
    if !allConstraints.isEmpty {
      NSLayoutConstraint.deactivate(allConstraints)
      allConstraints.removeAll()
    }
    
    let newInsets = view.safeAreaInsets
    let leftMargin = newInsets.left > 0 ? newInsets.left : Metrics.padding
    let rightMargin = newInsets.right > 0 ? newInsets.right : Metrics.padding
    let topMargin = newInsets.top > 0 ? newInsets.top : Metrics.padding
    let bottomMargin = newInsets.bottom > 0 ? newInsets.bottom : Metrics.padding
    
    let metrics: [String: Any] = [
      "horizontalPadding": Metrics.padding,
      "iconImageViewWidth": Metrics.iconImageViewWidth,
      "topMargin": topMargin,
      "bottomMargin": bottomMargin,
      "leftMargin": leftMargin,
      "rightMargin": rightMargin]
    
    let views: [String: Any] = [
      "iconImageView": iconImageView,
      "appNameLabel": appNameLabel,
      "skipButton": skipButton,
      "appImageView": appImageView,
      "welcomeLabel": welcomeLabel,
      "summaryLabel": summaryLabel,
      "pageControl": pageControl]
    
    let iconVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:|-topMargin-[iconImageView(30)]",
      metrics: metrics,
      views: views)
    allConstraints += iconVerticalConstraints
    
    let topRowHorizontalFormat = """
  H:|-leftMargin-[iconImageView(iconImageViewWidth)]-[appNameLabel]-[skipButton]-rightMargin-|
  """
    let topRowHorizontalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: topRowHorizontalFormat,
      options: [.alignAllCenterY],
      metrics: metrics,
      views: views)
    allConstraints += topRowHorizontalConstraints
    
    let summaryHorizontalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-horizontalPadding-[summaryLabel]-horizontalPadding-|",
      metrics: metrics,
      views: views)
    allConstraints += summaryHorizontalConstraints
    
    let iconToImageVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:[iconImageView]-10-[appImageView]",
      metrics: nil,
      views: views)
    allConstraints += iconToImageVerticalConstraints
    
    let imageToWelcomeVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:[appImageView]-10-[welcomeLabel]",
      options: [.alignAllCenterX],
      metrics: nil,
      views: views)
    allConstraints += imageToWelcomeVerticalConstraints
    
    let summaryLabelVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:[welcomeLabel]-4-[summaryLabel]",
      options: [.alignAllLeading, .alignAllTrailing],
      metrics: nil,
      views: views)
    allConstraints += summaryLabelVerticalConstraints
    
    let summaryToPageVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:[summaryLabel]-15-[pageControl(9)]-bottomMargin-|",
      options: [.alignAllCenterX],
      metrics: metrics,
      views: views)
    allConstraints += summaryToPageVerticalConstraints
    
    NSLayoutConstraint.activate(allConstraints)
  }
  
  /*
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let metrics: [String : Any] = [
      "horizontalPadding": Metrics.padding,
      "iconImageViewWidth": Metrics.iconImageViewWidth]
    
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
    
//    let nameLabelVerticalConstraints = NSLayoutConstraint.constraints(
//      withVisualFormat: "V:|-23-[appNameLabel]",
//      metrics: nil,
//      views: views)
//    allConstraints += nameLabelVerticalConstraints
//
//    let skipButtonVerticalConstraints = NSLayoutConstraint.constraints(
//      withVisualFormat: "V:|-20-[skipButton]",
//      metrics: nil,
//      views: views)
//    allConstraints += skipButtonVerticalConstraints
    
    let topRowHorizontalFormat = "H:|-horizontalPadding-[iconImageView(iconImageViewWidth)]-[appNameLabel]-[skipButton]-horizontalPadding-|"
    
    let topRowHorizontalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: topRowHorizontalFormat, // string is saved above
      options: [.alignAllCenterY], // works for all elements because icon is set above
      metrics: metrics,
      views: views)
    allConstraints += topRowHorizontalConstraints
    
    let summaryHorizontalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-horizontalPadding-[summaryLabel]-horizontalPadding-|",
      metrics: metrics,
      views: views)
    allConstraints += summaryHorizontalConstraints
    
    
//    let welcomeHorizontalConstraints = NSLayoutConstraint.constraints(
//      withVisualFormat: "H:|-15-[welcomeLabel]-15-|",
//      metrics: nil,
//      views: views)
//    allConstraints += welcomeHorizontalConstraints
    
    let iconToImageVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:[iconImageView]-10-[appImageView]",
      metrics: nil,
      views: views)
    allConstraints += iconToImageVerticalConstraints
    
    let imageToWelcomeVerticalConstraint = NSLayoutConstraint.constraints(
      withVisualFormat: "V:[appImageView]-10-[welcomeLabel]",
      options: [.alignAllCenterX],
      metrics: nil,
      views: views)
    allConstraints += imageToWelcomeVerticalConstraint
    
    let summaryLabelVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:[welcomeLabel]-4-[summaryLabel]",
      options: [.alignAllLeading, .alignAllTrailing],
      metrics: nil,
      views: views)
    allConstraints += summaryLabelVerticalConstraints
    
    let summaryToPageControlVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:[summaryLabel]-15-[pageControl(9)]-15-|",
      options: [.alignAllCenterX],
      metrics: nil,
      views: views)
    allConstraints += summaryToPageControlVerticalConstraints
    
    
    NSLayoutConstraint.activate(allConstraints)
  }
  */
}
