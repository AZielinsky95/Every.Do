//
//  AddItemViewController.h
//  Every.Do
//
//  Created by Alejandro Zielinsky on 2018-04-24.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddItemViewController;
@class Todo;

@protocol AddItemViewControllerDelegate<NSObject>
-(void)addItemViewController:(AddItemViewController*)controller didAddItem:(Todo*)item;
@end

@interface AddItemViewController : UIViewController

@property (nonatomic,weak) id <AddItemViewControllerDelegate> delegate;
@end
