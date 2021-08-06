//
//  SearchViewController.h
//  学生管理系统
//
//  Created by 张佳乔 on 2021/8/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *nameArray;
@property (nonatomic, strong) NSMutableArray *classArray;
@property (nonatomic, strong) NSMutableArray *gradeArray;
@property (nonatomic, strong) UITextField *nameText;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *sureButton;
@property (nonatomic, assign) NSInteger indexNumber;
@property (nonatomic, assign) NSInteger arrayCount;
@property (nonatomic, copy) NSString *nameString;
@property (nonatomic, copy) NSString *classString;
@property (nonatomic, copy) NSString *gradeString;
@property (nonatomic, strong) NSMutableArray *similarArray;
@property (nonatomic, strong) NSMutableArray *findNameArray;
@property (nonatomic, strong) NSMutableArray *findClassArray;
@property (nonatomic, strong) NSMutableArray *findGradeArray;

@end

NS_ASSUME_NONNULL_END
