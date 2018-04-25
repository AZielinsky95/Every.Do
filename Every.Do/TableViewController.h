//
//  TableViewController.h
//  Every.Do
//
//  Created by Alejandro Zielinsky on 2018-04-24.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddItemViewController.h"
@interface TableViewController : UITableViewController <AddItemViewControllerDelegate>

//@property (nonatomic,strong) NSMutableArray *todoItems;

@property (nonatomic,strong) NSMutableArray *openItems;
@property (nonatomic,strong) NSMutableArray *closedItems;

@end
