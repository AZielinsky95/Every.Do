//
//  DetailViewController.h
//  Every.Do
//
//  Created by Alejandro Zielinsky on 2018-04-24.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"
@interface DetailViewController : UIViewController

//@property (nonatomic) NSString* titleToSet;
//@property (nonatomic) NSString* textToSet;
//@property (nonatomic) NSString* priorityNumToSet;

@property (nonatomic) Todo *detailedItem;
@end
