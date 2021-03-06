//
//  JTagListView.h
//  JTagList
//
//  Created by apple on 15/11/25.
//  Copyright © 2015年 jacky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTagListView : UIView

//设置字体的颜色
@property (nonatomic,strong) UIColor *textColor;

//返回tag在最后的view伤的高度y的值
@property  CGFloat tagHeight;

@property (nonatomic,copy) void(^tagClick)(long index);


-(instancetype)initWithFrame:(CGRect)frame andNameDatasource:(NSArray *)tagDatasource andTagColorDatasource:(NSArray *)taColorDatasource;
@end
