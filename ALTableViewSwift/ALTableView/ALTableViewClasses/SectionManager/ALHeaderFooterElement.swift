//
//  ALHeaderFooterElement.swift
//  ALTableView
//
//  Created by lorenzo villarroel perez on 20/3/18.
//  Copyright © 2018 lorenzo villarroel perez. All rights reserved.
//

import UIKit

public typealias ALHeaderFooterPressedHandler = (ALHeaderFooterProtocol) -> Void
public typealias ALHeaderFooterCreatedHandler = (Any, ALHeaderFooterProtocol) -> Void
public typealias ALHeaderFooterDeselectedHandler = (ALHeaderFooterProtocol) -> Void

//Implemented by ALHeaderFooterElement
protocol ALHeaderFooterElementProtocol {
    func headerFooterElementPressed(view: ALHeaderFooterProtocol)
}

//Implemented by UITableViewCell
public protocol ALHeaderFooterProtocol {
    func viewPressed () -> Void
    func viewCreated(dataObject: Any) -> Void
}

class ALHeaderFooterElement: ALElement, ALHeaderFooterElementProtocol {

    private var pressedHandler: ALHeaderFooterPressedHandler?
    private var createdHandler: ALHeaderFooterCreatedHandler?
    
    //MARK: - Initializers
    
    init(identifier: String, dataObject: Any, estimateHeightMode: Bool = false, height: CGFloat = 44.0, pressedHandler: ALHeaderFooterPressedHandler? = nil, createdHandler: ALHeaderFooterCreatedHandler? = nil) {
        self.pressedHandler = pressedHandler
        self.createdHandler = createdHandler
        super.init(identifier: identifier, dataObject: dataObject, estimateHeightMode: estimateHeightMode, height: height)
    }
    
    //MARK: - Getters
    
    internal func getViewFrom(tableView: UITableView) -> UITableViewHeaderFooterView {
        
        if let dequeuedElement: UITableViewHeaderFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: self.identifier)  {
            if let alHeaderFooter = dequeuedElement as? ALHeaderFooterProtocol {
                alHeaderFooter.viewCreated(dataObject: self.dataObject)
                if let handler:ALHeaderFooterCreatedHandler = self.createdHandler {
                    handler(self.dataObject, alHeaderFooter)
                }
            }
            return dequeuedElement
        }
        return UITableViewHeaderFooterView()
    }
    
    //MARK: - ALHeaderFooterElementProtocol
    
    func headerFooterElementPressed(view: ALHeaderFooterProtocol) {
        view.viewPressed()
        if let handler:ALHeaderFooterPressedHandler = self.pressedHandler {
            handler(view)
        }
    }
}










