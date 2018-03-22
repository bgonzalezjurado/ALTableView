//
//  ALTableViewDelegate.swift
//  ALTableView
//
//  Created by lorenzo villarroel perez on 16/3/18.
//  Copyright © 2018 lorenzo villarroel perez. All rights reserved.
//

import UIKit

//MARK: - UITableViewDelegate

extension ALTableView: UITableViewDelegate {
    
    //MARK: - Configuring Rows
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.sectionManager.getCellEstimatedHeightFrom(indexPath: indexPath)
//        guard let rowElement: ALRowElement = self.sectionManager.getRowElementAtIndexPath(indexPath: indexPath) else {
//            return 0
//        }
        
//        if rowElement.isEstimateHeightMode() {
//            return UITableViewAutomaticDimension
//        } else {
//            let estimatedHeight: CGFloat = self.sectionManager.getCellHeightFrom(indexPath: indexPath)
//            return estimatedHeight
//        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let estimatedHeight: CGFloat = self.sectionManager.getCellHeightFrom(indexPath: indexPath)
        return estimatedHeight
    }
    
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        //We set up the cellHeight again to avoid stuttering scroll when using automatic dimension with cells
        let cellHeight = cell.frame.size.height
        self.sectionManager.setRowElementHeight(height: cellHeight, indexPath: indexPath)
        
        if self.isLastIndexPath(indexPath: indexPath, tableView: tableView) {
            //We reached the end of the tableView
            self.delegate?.tableViewDidReachEnd?()
        }
    }
    
    //MARK: - Managing selections
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        return indexPath
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell: UITableViewCell = tableView.cellForRow(at: indexPath),
            let rowElement: ALRowElement = self.sectionManager.getRowElementAtIndexPath(indexPath: indexPath) else {
            return
        }
        rowElement.rowElementPressed(viewController: self.viewController, cell: cell)
        
    }
    
    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        guard let cell: UITableViewCell = tableView.cellForRow(at: indexPath),
            let rowElement: ALRowElement = self.sectionManager.getRowElementAtIndexPath(indexPath: indexPath) else {
            return
        }
        rowElement.rowElementDeselected(cell: cell)
    }
    
    //MARK: - Modifying Header and Footer of Sections
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        
        let estimatedHeight: CGFloat = self.sectionManager.getHeaderHeightFrom(section: section)
        return estimatedHeight
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        
        let estimatedHeight: CGFloat = self.sectionManager.getFooterHeightFrom(section: section)
        return estimatedHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return self.sectionManager.getHeaderFrom(tableView: tableView, section:section)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return self.sectionManager.getHeaderFrom(tableView: tableView, section:section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.sectionManager.getHeaderEstimatedHeightFrom(section: section)
//        guard let headerElement = self.sectionManager.getHeaderElementAtSection(section: section) else {
//            return 0
//        }
//        if headerElement.isEstimateHeightMode() {
//            return UITableViewAutomaticDimension
//        } else {
//            let estimatedHeight: CGFloat = self.sectionManager.getHeaderHeightFrom(section: section)
//            return estimatedHeight
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.sectionManager.getFooterEstimatedHeightFrom(section: section)
//        guard let footerElement = self.sectionManager.getFooterElementAtSection(section: section) else {
//            return 0
//        }
//        if footerElement.isEstimateHeightMode() {
//            return UITableViewAutomaticDimension
//        } else {
//            let estimatedHeight: CGFloat = self.sectionManager.getFooterHeightFrom(section: section)
//            return estimatedHeight
//        }
    }
    
    //MARK: - Private methods
    
    private func isLastIndexPath (indexPath: IndexPath, tableView: UITableView) -> Bool {
        
        let isLastSection: Bool = indexPath.section == tableView.numberOfSections
        let isLastRow: Bool = indexPath.row == tableView.numberOfRows(inSection: indexPath.section)
        return isLastSection && isLastRow
    }
    
}
