//
//  ViewController.m
//  20160426001-CoreAnimation-CAShapeLayer
//
//  Created by Rainer on 16/4/26.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)startAnimationClickAction:(id)sender {
    DrawView *drawView = (DrawView *)self.view;
    
    [drawView startAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
