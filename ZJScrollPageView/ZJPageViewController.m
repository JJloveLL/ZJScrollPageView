//
//  ZJPageViewController.m
//  ZJScrollPageView
//
//  Created by ZeroJ on 16/8/31.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ZJPageViewController.h"

@interface ZJPageViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation ZJPageViewController
extern NSString *const ZJParentTableViewDidLeaveFromTopNotification;

- (void)viewDidLoad {
    [super viewDidLoad];
    /// 利用通知可以同时修改所有的子控制器的scrollView的contentOffset为CGPointZero
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(leaveFromTop) name:ZJParentTableViewDidLeaveFromTopNotification object:nil];
}


- (void)leaveFromTop {
    _scrollView.contentOffset = CGPointZero;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    _scrollView = scrollView;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(scrollViewIsScrolling:)]) {
        [self.delegate scrollViewIsScrolling:scrollView];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
