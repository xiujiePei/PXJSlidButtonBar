//
//  PXJSlidButton.m
//  MasonryViewController
//
//  Created by hh on 16/5/30.
//  Copyright © 2016年 pxj. All rights reserved.
//

#import "PXJSlidButton.h"
#define bottomBackImage 2.0
@implementation PXJSlidButton

- (id)init{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)setIsClicked:(BOOL)isClicked{
    if (isClicked) {
        [self setTitleColor:[UIColor colorWithRed:91.0/255.0 green:38.0/255.0 blue:140.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"activity_Selecd_bg.png"] forState:UIControlStateNormal];
        [self setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    }else{
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setImage:[UIImage imageWithCGImage:(__bridge CGImageRef _Nonnull)([UIColor clearColor])] forState:UIControlStateNormal];
        [self setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark - 重写，并规定title与image的大小
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height - bottomBackImage);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, contentRect.size.height - bottomBackImage, contentRect.size.width, bottomBackImage);
}

@end
