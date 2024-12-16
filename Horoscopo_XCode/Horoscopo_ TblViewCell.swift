//
//  Horoscopo_ TblViewCell.swift
//  Horoscopo_XCode
//
//  Created by Tardes on 12/12/24.
//

import UIKit

class Horoscopo__TblViewCell: UITableViewCell {

    @IBOutlet weak var icon_image: UIImageView!
    @IBOutlet weak var lbl_NameHoroscopo: UILabel!
    @IBOutlet weak var lbl_dateHoroscopo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        changeBackGroundColor()
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
// cambiar color de fondo de la celda  ----------------------------------------
    func changeBackGroundColor(){
        let nView = UIView()
        nView.backgroundColor = UIColor.orange
        
        self.selectedBackgroundView = nView
    }
   
    
// dibujar cada celda del horoscopo  ------------------------------------------
    
    func render(_ horoscopo: Horoscopo){
        
        lbl_NameHoroscopo.text = horoscopo.name
        lbl_dateHoroscopo.text = horoscopo.dates
        icon_image.image = horoscopo.icon

        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
