//
//  SummaryViewController.swift
//  Contact Card
//
//  Created by Mathieu Knook on 19/10/2017.
//  Copyright © 2017 Mathieu Knook. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    @IBOutlet weak var imgProfilePicture: UIImageView!
    @IBOutlet weak var lblFullName: UILabel!
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblFullName.text = person?.name
        imgProfilePicture.image = person?.photo
        
        let width = imgProfilePicture.bounds.width / 2.0;
        imgProfilePicture.layer.cornerRadius = width
        imgProfilePicture.layer.borderColor = UIColor.white.cgColor
        imgProfilePicture.layer.borderWidth = 1.0
        imgProfilePicture.clipsToBounds = true
        imgProfilePicture.alpha = 0.1
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.4,
                       delay: 0.1,
                       options: UIViewAnimationOptions.curveEaseInOut,
                       animations: { self.imgProfilePicture.alpha = 1.0 },
                       completion: { isDone in print( "IsDone: " + String(isDone))  }
        )
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
