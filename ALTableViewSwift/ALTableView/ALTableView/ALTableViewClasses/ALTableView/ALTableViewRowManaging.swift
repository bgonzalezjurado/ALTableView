//
//  ALTableViewRowManaging.swift
//  ALTableView
//
//  Created by lorenzo villarroel perez on 16/3/18.
//  Copyright © 2018 lorenzo villarroel perez. All rights reserved.
//

import UIKit

//MARK: - Managing the insertion of new cells

extension ALTableView {
    
    private func insert(rowElements: Array<ALRowElement>, section: Int, position: ALPosition, animation: UITableViewRowAnimation = .top) -> Bool {
        
        guard let sectionElement: ALSectionElement = self.getSectionElementAt(index: section),
            sectionElement.insert(rowElements: rowElements, at: position) else {
                return false
        }

        let indexPathes = self.getIndexPathes(section: section, position: position, numberOfRowElements: rowElements.count, operation: .insert)
        self.tableView?.beginUpdates()
        self.tableView?.insertRows(at: indexPathes, with: animation)
        self.tableView?.endUpdates()
        return true
    }
    
    private func insert(rowElement: ALRowElement, section: Int, position: ALPosition, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.insert(rowElements: [rowElement], section: section, position: position, animation: animation)
    }
    
    public func insert(rowElements: Array<ALRowElement>, section: Int, row: Int, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.insert(rowElements: rowElements, section: section, position: .middle(row), animation: animation)
    }
    
    public func insert(rowElement: ALRowElement, at indexPath: IndexPath, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.insert(rowElement: rowElement, section: indexPath.section, row: indexPath.row, animation: animation)
    }
    
    public func insert(rowElement: ALRowElement, section: Int, row: Int, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.insert(rowElements: [rowElement], section: section, row: row, animation: animation)
    }
    
    public func insert(rowElements: Array<ALRowElement>, at indexPath: IndexPath, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.insert(rowElements: rowElements, section: indexPath.section, row: indexPath.row, animation: animation)
    }
    
    public func insert(rowElement: ALRowElement, atTheBeginingOfSection section: Int, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.insert(rowElement: rowElement, section: section, position: .begining, animation: animation)
    }
    
    public func insert(rowElements: Array<ALRowElement>, atTheBeginingOfSection section: Int, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.insert(rowElements: rowElements, section: section, position: .begining, animation: animation)
    }
    
    public func insert(rowElement: ALRowElement, atTheEndOfSection section: Int, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.insert(rowElement: rowElement, section: section, position: .end, animation: animation)
    }
    
    public func insert(rowElements: Array<ALRowElement>, atTheEndOfSection section: Int, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.insert(rowElements: rowElements, section: section, position: .end, animation: animation)
    }
}

//MARK: - Managing the removal of new cells

extension ALTableView {
    
    private func remove(rowElements: Array<ALRowElement>, section: Int, position: ALPosition, animation: UITableViewRowAnimation = .top) -> Bool {
        
        
        guard let sectionElement: ALSectionElement = self.getSectionElementAt(index: section),
            sectionElement.deleteRowElements(numberOfRowElements: rowElements.count, at: position) else {
                return false
        }
        let indexPathes = self.getIndexPathes(section: section, position: position, numberOfRowElements: rowElements.count, operation: .delete)
        self.tableView?.beginUpdates()
        self.tableView?.deleteRows(at: indexPathes, with: animation)
        self.tableView?.endUpdates()
        return true
    }
    
    private func remove(rowElement: ALRowElement, section: Int, position: ALPosition, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.remove(rowElements: [rowElement], section: section, position: position, animation: animation)
    }
    
    
    
    public func remove(rowElements: Array<ALRowElement>, section: Int, row: Int, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.remove(rowElements: rowElements, section: section, position: .middle(row), animation: animation)
    }
    
    public func remove(rowElement: ALRowElement, at indexPath: IndexPath, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.remove(rowElement: rowElement, section: indexPath.section, row: indexPath.row, animation: animation)
    }
    
    public func remove(rowElement: ALRowElement, section: Int, row: Int, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.remove(rowElements: [rowElement], section: section, row: row, animation: animation)
    }
    
    public func remove(rowElements: Array<ALRowElement>, at indexPath: IndexPath, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.remove(rowElements: rowElements, section: indexPath.section, row: indexPath.row, animation: animation)
    }
    
    public func remove(rowElement: ALRowElement, atTheBeginingOfSection section: Int, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.remove(rowElement: rowElement, section: section, position: .begining, animation: animation)
    }
    
    public func remove(rowElements: Array<ALRowElement>, atTheBeginingOfSection section: Int, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.remove(rowElements: rowElements, section: section, position: .begining, animation: animation)
    }
    
    public func remove(rowElement: ALRowElement, atTheEndOfSection section: Int, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.remove(rowElement: rowElement, section: section, position: .end, animation: animation)
    }
    
    public func remove(rowElements: Array<ALRowElement>, atTheEndOfSection section: Int, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.remove(rowElements: rowElements, section: section, position: .end, animation: animation)
    }
}

//MARK: - Managing the replacement of new cells

extension ALTableView {
    
    private func replace(rowElements: Array<ALRowElement>, section: Int, position: ALPosition, animation: UITableViewRowAnimation = .top) -> Bool {
        
        guard let sectionElement: ALSectionElement = self.getSectionElementAt(index: section),
            sectionElement.replace(rowElements: rowElements, at: position) else {
                return false
        }
        let indexPathes = self.getIndexPathes(section: section, position: position, numberOfRowElements: rowElements.count, operation: .replace)
        self.tableView?.beginUpdates()
        self.tableView?.reloadRows(at: indexPathes, with: animation)
        self.tableView?.endUpdates()
        return true
    }
    
    private func replace(rowElement: ALRowElement, section: Int, position: ALPosition, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.replace(rowElements: [rowElement], section: section, position: position, animation: animation)
    }
    
    public func replace(rowElements: Array<ALRowElement>, section: Int, row: Int, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.replace(rowElements: rowElements, section: section, position: .middle(row), animation: animation)
    }
    
    public func replace(rowElement: ALRowElement, at indexPath: IndexPath, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.replace(rowElement: rowElement, section: indexPath.section, row: indexPath.row, animation: animation)
    }
    
    public func replace(rowElement: ALRowElement, section: Int, row: Int, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.replace(rowElements: [rowElement], section: section, row: row, animation: animation)
        
    }
    
    public func replace(rowElements: Array<ALRowElement>, at indexPath: IndexPath, animation: UITableViewRowAnimation = .top) -> Bool {
        
        return self.replace(rowElements: rowElements, section: indexPath.section, row: indexPath.row, animation: animation)
    }
}

//MARK: - Private methods

extension ALTableView {
    
    private func getIndexPathes(section: Int, position: ALPosition, numberOfRowElements: Int, operation: ALOperation) -> Array<IndexPath>{
        
        let numberOfElements: Int = self.getSectionElementAt(index: section)?.getNumberOfRows() ?? 0
        let indexOperator: ALIndexOperator = operation.getIndexOperator(position: position, numberOfElements: numberOfElements)
        let row: Int = indexOperator.calculateIndex()
        
        var indexPathes: Array<IndexPath> = [IndexPath]()
        for i in 0..<numberOfRowElements {
            let indexPath: IndexPath = IndexPath(row: i + row, section: section)
            indexPathes.append(indexPath)
        }
        
        return indexPathes
    }
    
}

//MARK: - ALSectionHeaderViewDelegate

extension ALTableView: ALSectionHeaderViewDelegate {
    
    func sectionOpened(sectionElement: ALSectionElement) {
        
        guard let section: Int = sectionElements.index(of: sectionElement) else {
            return
        }
        let numberOfElements: Int = sectionElement.getNumberOfRealRows()
        let indexPathes = self.getIndexPathes(section: section, position: .begining, numberOfRowElements: numberOfElements, operation: .insert)
        self.tableView?.beginUpdates()
        self.tableView?.insertRows(at: indexPathes, with: .top)
        self.tableView?.endUpdates()
    }
    
    func sectionClosed(sectionElement: ALSectionElement) {
        
        guard let section: Int = sectionElements.index(of: sectionElement) else {
            return
        }
        let numberOfElements: Int = sectionElement.getNumberOfRealRows()
        let indexPathes = self.getIndexPathes(section: section, position: .begining, numberOfRowElements: numberOfElements, operation: .delete)
        self.tableView?.beginUpdates()
        self.tableView?.deleteRows(at: indexPathes, with: .top)
        self.tableView?.endUpdates()
    }
}
