//
//  MaximumPriceFilterOptionCell.swift
//  Cheers
//
//  Created by Meelad Dawood on 4/22/18.
//  Copyright © 2018 University of San Diego. All rights reserved.
//

import UIKit

class MaximumPriceFilterOptionCell: UICollectionViewCell {
    
    let masterList = SharedListsSingleton.shared.masterList
    var liveList = SharedListsSingleton.shared.liveList
    var notLiveList = SharedListsSingleton.shared.notLiveList
    
    var filtredMasterList = [Place]()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Maximum Price"
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ratingsSegementedControl: UISegmentedControl = {
        let seg = UISegmentedControl(items: ["$","$$","$$$","$$$$","$$$$$"])
        seg.translatesAutoresizingMaskIntoConstraints = false
        
        return seg
    }()
    
    @objc func segmenetSelected(sender:UISegmentedControl!)
    {
        print("value--\(sender.selectedSegmentIndex + 1)")
        filtredMasterList = masterList.filter {Int($0.record.price.count) <= Int(sender.selectedSegmentIndex + 1)}
        SharedListsSingleton.shared.filteredList = filtredMasterList
        //print(SharedListsSingleton.shared.filteredList)
    }
    
    override init(frame: CGRect) {
        super.init(frame:  frame)
        setUpViews()
        ratingsSegementedControl.addTarget(self, action: #selector(segmenetSelected), for: UIControlEvents.valueChanged)
        

        
    }
    
    func setUpViews() {
        
        let stackView: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [titleLabel,ratingsSegementedControl])
            stack.distribution = .fillEqually
            stack.axis = .vertical
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: self.topAnchor),
                                     stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
                                     stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
                                     stackView.heightAnchor.constraint(equalToConstant: 50)
            
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
