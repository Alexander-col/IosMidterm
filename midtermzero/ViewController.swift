//
//  SceneDelegate.swift
//  midtermzero
//
//  Created by Ale on 4/10/26.
//
import UIKit

class ViewController: UIViewController, SecondTableViewController.Delegate
{

    @IBOutlet weak var backgroundImageView: UIImageView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        backgroundImageView.image = UIImage(named: "image1")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
    }

    func didSelectBackgroundImage(named imageName: String)
    {
        backgroundImageView.image = UIImage(named: imageName)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "toSecondScreen",
           let destination = segue.destination as? SecondTableViewController
        {
            destination.delegate = self
        }
    }
}
