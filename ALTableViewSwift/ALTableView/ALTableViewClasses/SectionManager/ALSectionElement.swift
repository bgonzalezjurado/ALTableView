//
//  SectionElement.swift
//  ALTableView
//
//  Created by lorenzo villarroel perez on 7/3/18.
//  Copyright © 2018 lorenzo villarroel perez. All rights reserved.
//

import UIKit

//Implemented by ALSectionManager
protocol ALSectionHeaderViewDelegate: class {
    func sectionOpened(sectionElement: ALSectionElement)
    func sectionClosed(sectionElement: ALSectionElement)
}

class ALSectionElement {

    //MARK: - Properties
    
//    private let viewHeader: UIView
//    private let viewFooter: UIView
    
//    private let headerHeight: CGFloat
//    private let footerHeight: CGFloat
    
    private let viewHeader: ALHeaderFooterElement?
    private let viewFooter: ALHeaderFooterElement?
    
    private var isOpened: Bool = true
    private let isExpandable: Bool
    
//    private var headerTapGesture: UITapGestureRecognizer?
    private var rowElements: Array<ALRowElement>
    
    internal weak var delegate: ALSectionHeaderViewDelegate?
    
    //MARK: - Initializers
    
//    init(rowElements: Array<ALRowElement>, viewHeader: UIView = UIView(), viewFooter: UIView = UIView(), headerHeight: CGFloat = 0, footerHeight: CGFloat = 0, isExpandable: Bool = false) {
//        self.viewHeader = viewHeader
//        self.viewFooter = viewFooter
//        self.headerHeight = headerHeight
//        self.footerHeight = footerHeight
//        self.isExpandable = isExpandable
//        self.rowElements = rowElements
//        self.setUpHeaderRecognizer()
//    }
    
    init(rowElements: Array<ALRowElement>, viewHeader: ALHeaderFooterElement?, viewFooter: ALHeaderFooterElement?, headerHeight: CGFloat = 0, footerHeight: CGFloat = 0, isExpandable: Bool = false) {
        
        self.viewHeader = viewHeader
        self.viewFooter = viewFooter
        self.isExpandable = isExpandable
        self.rowElements = rowElements
//        self.setUpHeaderRecognizer()
    }
    
    
    //MARK: - Getters
    
    internal func getHeader() -> UIView {
        return UIView()
//        return self.viewHeader
    }
    
    internal func getFooter() -> UIView {
        return UIView()
//        return self.viewFooter
    }
    
    internal func getHeaderHeight() -> CGFloat {

        return self.viewHeader?.getHeight() ?? 0.0
    }

    internal func getFooterHeight() -> CGFloat {

        return self.viewFooter?.getHeight() ?? 0.0
    }
    
    internal func getNumberOfRows() -> Int {
        
        if self.isOpened {
            return self.rowElements.count
        } else {
            return 0
        }
    }
    
    internal func getNumberOfRealRows() -> Int {
        
        return self.rowElements.count
    }
    
    internal func getRowElementAt(position: Int) -> ALRowElement? {
        
        let rowElement: ALRowElement? = self.rowElements[safe: position]
        return rowElement
    }
    
    internal func getRowHeight(at position: Int) -> CGFloat? {
        
        guard let rowElement = self.getRowElementAt(position: position) else {
            return nil
        }
        return rowElement.getHeight()
    }
    
    internal func getHeaderElementAt(position: Int) -> ALHeaderFooterElement? {
        
        return self.viewHeader
    }
    
    internal func getFooterElementAt(position: Int) -> ALHeaderFooterElement? {
        
        return self.viewFooter
    }
    
//    internal func getSectionTitleIndex() -> String {
//        return self.sectionTitleIndex
//    }
    
    //MARK: - Managing the insertion of new cells
    
    internal func insert(rowElements: Array<ALRowElement>, at index: Int) -> Bool {
        
        self.rowElements.insert(contentsOf: rowElements, at: index)
        return true
    }
    
    //MARK: - Managing the deletion of new cells

    internal func deleteRowElements(numberOfRowElements: Int, at index: Int) -> Bool {
        
        let endIndex: Int = index + numberOfRowElements
        guard self.rowElements.indices.contains(endIndex) else {
            return false
        }
        self.rowElements.removeSubrange(index...endIndex)
        return true
    }
    
    //MARK: - Managing the replacement of new cells
    
    internal func replace(rowElements: Array<ALRowElement>, at index: Int) -> Bool {
        
        guard self.deleteRowElements(numberOfRowElements: rowElements.count, at: index),
        self.insert(rowElements: rowElements, at: index) else {
            return false
        }
        return true
    }
    
    //MARK: - Managing the opening and close of section
    
//    private func setUpHeaderRecognizer () -> Void {
//
//        self.viewHeader.isUserInteractionEnabled = true
//        let headerTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.toggleOpen(sender:)))
//        self.viewHeader.addGestureRecognizer(headerTapGesture)
//    }
    
    @objc private func toggleOpen(sender: Any) {
        
        if self.isExpandable {
            self.toggleOpenWith(userAction: true)
        }
    }
    
    private func toggleOpenWith(userAction: Bool) {
        
        guard let delegate = self.delegate else {
            return
        }
        self.isOpened = !self.isOpened
        if userAction {
            if self.isOpened {
                delegate.sectionOpened(sectionElement: self)
            } else {
                delegate.sectionClosed(sectionElement: self)
            }
        }
    }
}

//MARK: - Equatable

extension ALSectionElement: Equatable {
    
    static func ==(lhs: ALSectionElement, rhs: ALSectionElement) -> Bool {
        
        return lhs === rhs
    }
}
































