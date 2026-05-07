//
//  SceneDelegate.swift
//  midtermzero
//
//  Created by Ale on 4/10/26.
//
import UIKit
class SecondTableViewController: UITableViewController {

    protocol Delegate: AnyObject {
        func didSelectBackgroundImage(named imageName: String)
    }

    weak var delegate: Delegate?
//using images from assets to create into array
    let backgrounds = ["image1", "image2", "image3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }
    //Create each cell to have the paired image and name

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return backgrounds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BackgroundCell", for: indexPath) as? BackgroundTableViewCell else
        {
            return UITableViewCell()
        }

        let imageName = backgrounds[indexPath.row]
        cell.cellLabel.text = imageName
        cell.cellImageView.image = UIImage(named: imageName)

        return cell
    }
//Tells delegate when a row is tapped to start background change process
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let selectedImageName = backgrounds[indexPath.row]
        delegate?.didSelectBackgroundImage(named: selectedImageName)
        dismiss(animated: true)
    }
}
