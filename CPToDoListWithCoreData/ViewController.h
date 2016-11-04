//
//  ViewController.h
//  CPToDoListWithCoreData
//
//  Created by Student P_07 on 04/11/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "addContactsViewController.h"
#import "customTableViewCell.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSArray *contactsArray;
}
- (IBAction)addAction:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *contactsTableView;

@end

