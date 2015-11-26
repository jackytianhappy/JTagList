//
//  JTagListView.m
//  JTagList
//
//  Created by apple on 15/11/25.
//  Copyright © 2015年 jacky. All rights reserved.
//

#import "JTagListView.h"

@implementation JTagListView

//字体大小
#define FONTSIZE 15
//tag标签的高度
#define TAGHEIGHT 20
//tag标签内部文字两边的距离
#define TAGINNERPADDING 5

//顶部间距
#define TOPPADDING 5
//距前一个的距离 水平
#define PADDING 5


-(instancetype)initWithFrame:(CGRect)frame andNameDatasource:(NSArray *)tagDatasource andTagColorDatasource:(NSArray *)tagColorDatasource{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat lastPositionX   = 0;
        CGFloat lastPositionY   = 0;
        CGFloat computeTagWidth = 0;
        
        for (int i =0 ; i<tagDatasource.count; i++) {
           computeTagWidth         = FONTSIZE*[self convertToInt:[NSString stringWithFormat:@"%@",tagDatasource[i]]] + TAGINNERPADDING*2;

           if ((lastPositionX + PADDING + computeTagWidth)>frame.size.width) {
           lastPositionX           = 0;
                    lastPositionY +=(TOPPADDING + TAGHEIGHT);
           }

           UIButton *btn           = [[UIButton alloc]initWithFrame:CGRectMake(lastPositionX+PADDING, lastPositionY+TOPPADDING, computeTagWidth, TAGHEIGHT)];
           btn.layer.masksToBounds = YES;
           btn.layer.cornerRadius  = TAGHEIGHT*0.5;
           btn.titleLabel.font     = [UIFont systemFontOfSize:FONTSIZE];
           [btn setBackgroundColor:[self getRandomColor:tagColorDatasource]];
           [btn setTitleColor:(self.textColor == nil?[UIColor whiteColor]:self.textColor) forState:UIControlStateNormal];
           [btn setTitle:tagDatasource[i] forState:UIControlStateNormal];
            
           //action
           btn.tag = i;
           [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

           lastPositionX           = CGRectGetMaxX(btn.frame);

           [self addSubview:btn];
        }
        
    }
    return self;
}

#pragma mark -action
-(void)btnClick:(UIButton *)btn{
    if (self.tagClick) {
        self.tagClick(btn.tag);
    }

}

#pragma mark - private help function
-(UIColor *)getRandomColor:(NSArray *)colorArray{
    if (colorArray == nil || colorArray.count == 0) {
        colorArray = @[
                       [UIColor colorWithRed:94/255.0 green:180/255.0 blue:108/255.0 alpha:1.0],
                       [UIColor colorWithRed:190/255.0 green:118/255.0 blue:192/255.0 alpha:1.0],
                       [UIColor colorWithRed:94/255.0 green:122/255.0 blue:213/255.0 alpha:1.0],
                       [UIColor colorWithRed:195/255.0 green:121/255.0 blue:195/255.0 alpha:1.0],
                       [UIColor colorWithRed:233/255.0 green:195/255.0 blue:108/255.0 alpha:1.0]
                       ];
    }
    int index = rand() % ((int)colorArray.count);
    
    return colorArray[index];
}


- (int)convertToInt:(NSString*)strtemp {
    int strlength = 0;
    char* p = (char*)[strtemp cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[strtemp lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return (strlength+1)/2;
    
}

@end
