//
//  Created by Tapash Majumder on 1/20/20.
//  Copyright © 2020 Iterable. All rights reserved.
//

import Foundation

import IterableSDK

extension MainViewController {
    /// To change sort order of messages, set the `comparator` property of view delegate.
    @IBAction private func onSortByTitleAscendingTapped() {
        // <ignore -- data loading>
        loadDataset(number: 1)
        // </ignore -- data loading>

        let viewController = IterableInboxNavigationViewController()
        viewController.viewDelegate = SortByTitleAscendingInboxViewDelegate()
        present(viewController, animated: true)
    }
}

public class SortByTitleAscendingInboxViewDelegate: IterableInboxViewControllerViewDelegate {
    public required init() {
    }
    
    public let comparator: (IterableInAppMessage, IterableInAppMessage) -> Bool = { message1, message2 in
        guard let title1 = message1.inboxMetadata?.title else {
            return true
        }
        guard let title2 = message2.inboxMetadata?.title else {
            return false
        }

        return title1.caseInsensitiveCompare(title2) == .orderedAscending
    }
}
