//
//  ShowViewController.h
//  学生管理系统
//
//  Created by 张佳乔 on 2021/8/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShowViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) NSMutableArray *nameArray;
@property (nonatomic, strong) NSMutableArray *classArray;
@property (nonatomic, strong) NSMutableArray *gradeArray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *increaseButton;
@property (nonatomic, strong) UIButton *delegateButton;
@property (nonatomic, strong) UIButton *changeButton;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UIButton *sortButton;

- (void)arrayInit;

@end

NS_ASSUME_NONNULL_END
