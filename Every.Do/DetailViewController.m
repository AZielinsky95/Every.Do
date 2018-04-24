//
//  DetailViewController.m
//  Every.Do
//
//  Created by Alejandro Zielinsky on 2018-04-24.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLabel.text = self.detailedItem.title;
     self.descriptionLabel.text = self.detailedItem.text;
     self.priorityLabel.text = [NSString stringWithFormat:@"P: %d",self.detailedItem.priorityNum];
}

@end
