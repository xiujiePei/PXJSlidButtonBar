//
//  ViewController.m
//  PXJSlidButtonBar
//
//  Created by hh on 16/5/30.
//  Copyright © 2016年 pxj. All rights reserved.
//

#import "ViewController.h"
#import "PXJSlidButton.h"
#define buttonTag 1000

@interface ViewController ()
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)NSArray *buttonContents;
@property(nonatomic,strong)PXJSlidButton *preButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.buttonContents = @[@"button1",@"longButton2",@"longlongButton3",@"btn",@"b",@"这是一个超长button",@"这个button更长更长更更长"];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    [self.view addSubview:self.scrollView];
    
    PXJSlidButton *btn;
    for (int i = 0; i < self.buttonContents.count; i++) {
        btn = [PXJSlidButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
        btn.translatesAutoresizingMaskIntoConstraints = NO;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.tag = buttonTag+i;
        [btn setTitle:self.buttonContents[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:btn];
        [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:btn.intrinsicContentSize.width+10]];
        [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:btn.intrinsicContentSize.height]];
        if (i == 0) {
            [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
            [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
            btn.isClicked = YES;
        }else{
            UIButton *preBtn = [self.scrollView viewWithTag:999+i];
            [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:preBtn attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
            [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:preBtn attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
            btn.isClicked = NO;
        }
        
        [btn layoutIfNeeded];
        if (i == 0) {
            self.preButton = btn;
        }
    }
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:btn attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    self.scrollView.contentSize = CGSizeMake(btn.frame.origin.x+btn.frame.size.width, btn.frame.size.height);
    [self.scrollView layoutIfNeeded];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)clickBtn:(id)sender{
    PXJSlidButton *btn = (PXJSlidButton *)sender;
    if (![self.preButton isEqual:btn]) {
        btn.isClicked = YES;
        self.preButton.isClicked = NO;
        self.preButton = btn;
    }
    
    NSString *buttonContent = self.buttonContents[btn.tag - buttonTag];
    NSLog(@"button title is %@",buttonContent);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
