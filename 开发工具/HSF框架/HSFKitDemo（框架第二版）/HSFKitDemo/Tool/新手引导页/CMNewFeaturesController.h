//
//  CMNewFeaturesController.h
//  CMKit
//
//  Created by HC on 16/11/7.
//  Copyright © 2016年 UTOUU. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^ExperienceBtnBlock)();

@interface CMNewFeaturesController : UIViewController

/** 新特性图片数组(图片字符串) */
@property (nonatomic, strong) NSArray *featuresArray;

/** 
 “立即体验”按钮
 
 便于外部修改按钮Title、点击背景Image、frame等
 */
@property (strong, nonatomic) UIButton *experienceBtn;

/** 立即体验按钮block */
@property (nonatomic, copy) ExperienceBtnBlock experienceBtnBlock;

/** PageControl的默认指示颜色 */
@property (strong, nonatomic) UIColor *pageIndicatorTintColor;

/** 当前选中PageControl的指示颜色 */
@property (strong, nonatomic) UIColor *currentPageIndicatorTintColor;



/**
 用法
 CMNewFeaturesController *Vc = [[CMNewFeaturesController alloc] init];
 Vc.featuresArray = self.featuresArray;
 [Vc.experienceBtn setTitle:@"你好" forState:UIControlStateNormal];
 Vc.currentPageIndicatorTintColor = [UIColor blackColor];
 Vc.pageIndicatorTintColor = [UIColor redColor];
 __weak typeof(Vc) weakVc = Vc;
 Vc.experienceBtnBlock = ^{
 [weakVc dismissViewControllerAnimated:YES completion:nil];
 };
 [self presentViewController:Vc animated:YES completion:nil];
 */





@end
