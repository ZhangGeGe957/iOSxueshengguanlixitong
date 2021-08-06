//
//  SortViewController.h
//  学生管理系统
//
//  Created by 张佳乔 on 2021/8/4.
//

#import <UIKit/UIKit.h>

@protocol SortDelegate <NSObject>

- (void)aNameArray:(NSMutableArray*)nameArray andClass:(NSMutableArray*)classArray andGrade:(NSMutableArray*)gradeArray;

@end

typedef void(^sortArray)(NSMutableArray *nameArray, NSMutableArray *classArray, NSMutableArray *gradeArray);

NS_ASSUME_NONNULL_BEGIN

@interface SortViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) NSMutableArray *nameArray;
@property (nonatomic, strong) NSMutableArray *classArray;
@property (nonatomic, strong) NSMutableArray *gradeArray;
@property (nonatomic, strong) UIButton *riseNameButton;
@property (nonatomic, strong) UIButton *declineNameButton;
@property (nonatomic, strong) UIButton *riseClassButton;
@property (nonatomic, strong) UIButton *declineClassButton;
@property (nonatomic, strong) UIButton *riseGradeButton;
@property (nonatomic, strong) UIButton *declineGradeButton;
@property (nonatomic, strong) NSMutableArray *allArray;
@property (nonatomic, weak) id<SortDelegate> delegate;
@property (nonatomic, strong) sortArray changeArray;
 
@end

NS_ASSUME_NONNULL_END
