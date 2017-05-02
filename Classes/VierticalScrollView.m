//
//  VierticalScrollView.m
//  上下滚动btn
//
//  Created by 李杨 on 16/2/25.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "VierticalScrollView.h"
#import "UIView+FrameExtension.h"
#define MMColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define MMRandomColor [UIColor whiteColor]/*MMColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))*/
#define Screen_width ([UIScreen mainScreen].bounds.size.width)
#define Screen_height ([UIScreen mainScreen].bounds.size.height)
#define BTNWidth self.bounds.size.width
#define BTNHeight self.bounds.size.height
@interface VierticalScrollView ()
@property (nonatomic,strong) NSMutableArray *titles;
@property(assign, nonatomic)int titleIndex;
@property(assign, nonatomic)int index;

@end
@implementation VierticalScrollView

-(instancetype)initWithArray:(NSArray *)titles AndFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
      
        NSMutableArray *MutableTitles = [NSMutableArray arrayWithArray:titles];
        NSString *str = @"";
        self.titles = MutableTitles;
        [self.titles addObject:str];
        self.index = 1;
        UIButton *btn = [[UIButton alloc]init];
        btn.frame = CGRectMake(0, 0, BTNWidth, BTNHeight);
        btn.tag = self.index;
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:self.titles[0] forState:UIControlStateNormal];
        btn.titleLabel.font =[UIFont systemFontOfSize:14];
        btn.titleLabel.numberOfLines=2;
        [btn setTitleColor:km_rgb_hex(0xeb443b) forState:UIControlStateNormal];
        [btn setBackgroundColor:MMRandomColor];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        [self addSubview:btn];
        self.clipsToBounds = YES;
        
        [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(nextButton) userInfo:nil repeats:YES];
    }
    
    return self;
}

+(instancetype)initWithTitleArray:(NSArray *)titles AndFrame:(CGRect)frame{
    return [[self alloc]initWithArray:titles AndFrame:frame];
}

-(void)nextButton{
    UIButton *firstBtn = [self viewWithTag:self.index];
    UIButton *modelBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, BTNHeight, BTNWidth, BTNHeight)];
    [modelBtn setBackgroundColor:MMRandomColor];
    modelBtn.tag = self.index + 1;
    if ([self.titles[self.titleIndex+1] isEqualToString:@""]) {
        self.titleIndex = -1;
        self.index = 0;
    }
    if (modelBtn.tag == self.titles.count) {
        
        modelBtn.tag = 1;
    }
    
    [modelBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [modelBtn setTitle:self.titles[self.titleIndex+1] forState:UIControlStateNormal];
      [modelBtn setTitleColor:km_rgb_hex(0xeb443b) forState:UIControlStateNormal];
    modelBtn.titleLabel.font =[UIFont systemFontOfSize:14];
      modelBtn.titleLabel.numberOfLines=2;
    modelBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:modelBtn];
    
    [UIView animateWithDuration:0.25 animations:^{
 
        firstBtn.frame =CGRectMake(0, -56, BTNWidth, BTNHeight);
        modelBtn.frame =CGRectMake(0, 0, BTNWidth, BTNHeight);
    } completion:^(BOOL finished) {
        [firstBtn removeFromSuperview];
        
    } ];
    self.index++;
    self.titleIndex++;
    
}

-(void)clickBtn:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(clickTitleButton:)]) {
        
        [self.delegate clickTitleButton:btn];
        
    }
}

@end
