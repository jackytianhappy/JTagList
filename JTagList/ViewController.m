//
//  ViewController.m
//  JTagList
//
//  Created by apple on 15/11/25.
//  Copyright © 2015年 jacky. All rights reserved.
//

#import "ViewController.h"
#import "JTagListView.h"

//屏幕的宽度
#define JBOUNDS [UIScreen mainScreen].bounds

@interface ViewController ()

@property (nonatomic,strong) JTagListView *tagView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIButton *btnOne = [[UIButton alloc]initWithFrame:CGRectMake(0, 30, 70, 20)];
    [btnOne setTitle:@"400宽度" forState:UIControlStateNormal];
    btnOne.tag = 400;
    [btnOne setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btnOne addTarget:self action:@selector(initpage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnOne];
    
    
    UIButton *btnTwo = [[UIButton alloc]initWithFrame:CGRectMake(90, 30, 70, 20)];
    [btnTwo setTitle:@"300宽度" forState:UIControlStateNormal];
    btnTwo.tag = 300;
    [btnTwo setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btnTwo addTarget:self action:@selector(initpage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnTwo];
   
    UIButton *btnThree= [[UIButton alloc]initWithFrame:CGRectMake(200, 30, 70, 20)];
    [btnThree setTitle:@"200宽度" forState:UIControlStateNormal];
    btnThree.tag = 200;
    [btnThree setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btnThree addTarget:self action:@selector(initpage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnThree];
    
}



-(void)initpage:(UIButton *)btn{
    [self.tagView removeFromSuperview];
    NSArray *tempName = @[@"欢迎提出宝贵的意见",@"作者jacky",@"欢迎补充功能",@"iOS developer",@"大家还有什么需诶去呢",@"多多指教",@"进行补充",@"提高控件质量",@"最后欢迎fork"];
    NSArray *tempColor = @[
                           [UIColor colorWithRed:94/255.0 green:180/255.0 blue:108/255.0 alpha:1.0],
                           [UIColor colorWithRed:190/255.0 green:118/255.0 blue:192/255.0 alpha:1.0],
                           [UIColor colorWithRed:94/255.0 green:122/255.0 blue:213/255.0 alpha:1.0],
                           [UIColor colorWithRed:195/255.0 green:121/255.0 blue:195/255.0 alpha:1.0],
                           [UIColor colorWithRed:233/255.0 green:195/255.0 blue:108/255.0 alpha:1.0]
                           ];
    
    
    //初始化数据
    self.tagView = [[JTagListView alloc]initWithFrame:CGRectMake(0, 100, btn.tag, 300) andNameDatasource:tempName andTagColorDatasource:tempColor];
    self.tagView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.tagView];
    //点击操作
    _tagView.tagClick =^(long index){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"友情提醒" message:tempName[index] delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        
        [alert show];
    };

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
