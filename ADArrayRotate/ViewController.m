//
//  ViewController.m
//  ADArrayRotate
//
//  Created by Aykut Dogru on 15/12/14.
//  Copyright (c) 2014 Aykut Dogru. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *mainArray;

@end

NSInteger arrayDimension = 5;

NSInteger mX = 0;
NSInteger mY = 0;
bool nX = true;
bool nY = true;
@implementation ViewController

- (void)viewDidLoad {
    //NSLog(@"%@",self.mainArray);
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self rotate];
}
- (void)rotate
{
    
    [self.view.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (![obj isKindOfClass:[UIButton class]]) {
            UIView *nView = (UIView *)obj;
            [nView removeFromSuperview];
        }
        
    }];
    
    NSInteger sX1;
    NSInteger sY1;
    NSInteger x = mX;
    NSInteger y = mY;
    
    if ((x == (arrayDimension - 1) && y != 0)) {
        x = 0;
    }
    else if ((x == 0 && y == (arrayDimension - 1)))
        x = 4;
    
    y = (y == (arrayDimension - 1)) ? 0 : y;
    
    sX1 = (x == (arrayDimension / 2)) ? 0 : 1;
    sY1 = (y == (arrayDimension / 2)) ? 0 : 1;
    
    sX1 *= (x > (arrayDimension / 2)) ? -1 : 1;
    sY1 *= (y > (arrayDimension / 2)) ? -1 : 1;
    
    CGRect frame = CGRectMake(30, 30, 20, 20);
    UIColor *nColor = [UIColor blueColor];
    for (int i = 0; i < arrayDimension; i++) {
        for (int j = 0; j < arrayDimension; j++) {
            if (i == y && x == j) {
                printf("*");
                nColor = [UIColor yellowColor];
                y += sY1;
                x += sX1;
            }
            else {
                nColor = [UIColor blueColor];
                printf("@");
            }
            UIView *nV = [[UIView alloc]initWithFrame:frame];
            nV.backgroundColor = nColor;
            [self.view addSubview:nV];
            frame.origin.x += frame.size.width + 5;
        }
        frame.origin.y += frame.size.height + 5;
        frame.origin.x = 30;
        
        printf("\n");
    }
    
    if (mX == (arrayDimension - 1)) {
        nX = false;
    }
    
    if (mY == (arrayDimension - 1)) {
        nY = false;
        
    }
    
    if (nX) {
        mX += 2;
    }
    else
    {
        if (nY) {
            mY += 2;
        }
        else
        {
            if (mX != 0) {
                mX -= 2;
            }
            else
            {
                if (mY != 0) {
                    mY -= 2;
                }
                
            }
            
        }
    }
    if (mX == 0 && mY == 0) {
        nX = true;
        nY = true;
    }
    
    
    NSLog(@"%d | %d",mX,mY);
    printf("-----------");
    printf("\n");
    [self performSelector:@selector(rotate) withObject:nil afterDelay:2.0];
    
}

- (void)rotateArray
{
    NSInteger avg = arrayDimension / 2;
    NSInteger x = 2;
    NSInteger y = 4;
    if (y == avg) {
        x = 0;
    }
    if (y == (arrayDimension - 1) && x == (arrayDimension - 1)) {
        y = 0;
        x = 0;
    }
    BOOL isInc = YES;
    BOOL isIncY = YES;
    
    BOOL isChangeX = YES;
    BOOL isChangeY = YES;
    if (y == avg) {
        isChangeY = NO;
    }
    
    if (x == avg) {
        isChangeX = NO;
    }
    
    if (x > (arrayDimension / 2)) {
        isInc = NO;
    }
    if (y > (arrayDimension / 2)) {
        isIncY = NO;
    }
    for (int i = 0 ; i < arrayDimension; i++) {
        for (int j = 0; j < arrayDimension; j++) {
            if (i == y && j == x) {
                printf("-");
                if (isChangeY) {
                    if (isIncY) {
                        y += 1;
                    }
                    else
                        y -= 1;
                }
                
                if (isChangeX) {
                    if (isInc) {
                        x += 1;
                    }
                    else
                        x -= 1;
                }
                
            }
            else
                printf("*");
            
        }
        printf("\n");
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
