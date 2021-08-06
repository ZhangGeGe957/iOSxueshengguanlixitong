//
//  ChangeViewController.h
//  学生管理系统
//
//  Created by 张佳乔 on 2021/8/1.
//

#import <UIKit/UIKit.h>

@protocol ChangeArray <NSObject>

- (void)changeInformation:(NSMutableArray*)informationArray andIndex:(NSInteger)indexNumber;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ChangeViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *sureButton;
@property (nonatomic, strong) UIButton *oneButton;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak) id<ChangeArray> delegate;
@property (nonatomic, strong) NSMutableArray *nameArray;
@property (nonatomic, strong) NSMutableArray *classArray;
@property (nonatomic, strong) NSMutableArray *gradeArray;
@property (nonatomic, strong) UITextField *nameText;
@property (nonatomic, strong) UITextField *classText;
@property (nonatomic, strong) UITextField *gradeText;
@property (nonatomic, strong) UIImageView *nameView;
@property (nonatomic, strong) UIImageView *classView;
@property (nonatomic, assign) NSInteger indexNumber;
@property (nonatomic, strong) NSMutableArray *returnArray;
@property (nonatomic, strong) NSMutableArray *similarArray;

- (void)allReadySearch;

@end

NS_ASSUME_NONNULL_END
