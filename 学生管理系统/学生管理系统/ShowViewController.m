//
//  ShowViewController.m
//  学生管理系统
//
//  Created by 张佳乔 on 2021/8/1.
//

#import "ShowViewController.h"
#import "IncreaseViewController.h"
#import "DeleteViewController.h"
#import "ChangeViewController.h"
#import "SearchViewController.h"
#import "SortViewController.h"
#import "NewTableViewCell.h"

#define width [UIScreen mainScreen].bounds.size.width
#define heigth [UIScreen mainScreen].bounds.size.height

@interface ShowViewController ()<IncreaseArray, DeleteArray, ChangeArray, SortDelegate>

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self arrayInit];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"show.jpeg"]];
    _backImageView.frame = CGRectMake(0, 0, width, heigth);
    [self.view addSubview:_backImageView];
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, 150, 50)];
    name.font = [UIFont systemFontOfSize:24];
    name.textAlignment = NSTextAlignmentCenter;
    name.textColor = [UIColor whiteColor];
    name.text = @"姓名";
    [_backImageView addSubview:name];
    
    UILabel *aclass = [[UILabel alloc] initWithFrame:CGRectMake(150, 45, 150, 50)];
    aclass.font = [UIFont systemFontOfSize:24];
    aclass.textAlignment = NSTextAlignmentCenter;
    aclass.textColor = [UIColor whiteColor];
    aclass.text = @"班级";
    [_backImageView addSubview:aclass];
    
    UILabel *grade = [[UILabel alloc] initWithFrame:CGRectMake(300, 45, 150, 50)];
    grade.font = [UIFont systemFontOfSize:24];
    grade.textAlignment = NSTextAlignmentCenter;
    grade.textColor = [UIColor whiteColor];
    grade.text = @"成绩";
    [_backImageView addSubview:grade];
    
    _closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_closeButton setTitle:@"退出" forState:UIControlStateNormal];
    _closeButton.frame = CGRectMake(320, 770, 60, 40);
    [_closeButton addTarget:self action:@selector(end:) forControlEvents:UIControlEventTouchUpInside];
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){1,1,1,1});
    [_closeButton.layer setBorderWidth:2];
    [_closeButton.layer setBorderColor:color];
    _closeButton.titleLabel.tintColor = [UIColor whiteColor];
    _closeButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_closeButton.layer setMasksToBounds:YES];
    [_closeButton.layer setCornerRadius:5.0];
    [self.view addSubview:_closeButton];
    
    _increaseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_increaseButton setTitle:@"增加" forState:UIControlStateNormal];
    _increaseButton.frame = CGRectMake(50, 700, 60, 40);
    [_increaseButton addTarget:self action:@selector(increase:) forControlEvents:UIControlEventTouchUpInside];
    [_increaseButton.layer setBorderWidth:2];
    [_increaseButton.layer setBorderColor:color];
    _increaseButton.titleLabel.tintColor = [UIColor whiteColor];
    _increaseButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_increaseButton.layer setMasksToBounds:YES];
    [_increaseButton.layer setCornerRadius:5.0];
    [self.view addSubview:_increaseButton];
    
    _delegateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_delegateButton setTitle:@"删除" forState:UIControlStateNormal];
    _delegateButton.frame = CGRectMake(140, 700, 60, 40);
    [_delegateButton addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
    [_delegateButton.layer setBorderWidth:2];
    [_delegateButton.layer setBorderColor:color];
    _delegateButton.titleLabel.tintColor = [UIColor whiteColor];
    _delegateButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_delegateButton.layer setMasksToBounds:YES];
    [_delegateButton.layer setCornerRadius:5.0];
    [self.view addSubview:_delegateButton];
    
    _changeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_changeButton setTitle:@"修改" forState:UIControlStateNormal];
    _changeButton.frame = CGRectMake(230, 700, 60, 40);
    [_changeButton addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [_changeButton.layer setBorderWidth:2];
    [_changeButton.layer setBorderColor:color];
    _changeButton.titleLabel.tintColor = [UIColor whiteColor];
    _changeButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_changeButton.layer setMasksToBounds:YES];
    [_changeButton.layer setCornerRadius:5.0];
    [self.view addSubview:_changeButton];
    
    _searchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_searchButton setTitle:@"查找" forState:UIControlStateNormal];
    _searchButton.frame = CGRectMake(320, 700, 60, 40);
    [_searchButton addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [_searchButton.layer setBorderWidth:2];
    [_searchButton.layer setBorderColor:color];
    _searchButton.titleLabel.tintColor = [UIColor whiteColor];
    _searchButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_searchButton.layer setMasksToBounds:YES];
    [_searchButton.layer setCornerRadius:5.0];
    [self.view addSubview:_searchButton];
    
    _sortButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_sortButton setTitle:@"排序" forState:UIControlStateNormal];
    _sortButton.frame = CGRectMake(50, 770, 60, 40);
    [_sortButton addTarget:self action:@selector(sort:) forControlEvents:UIControlEventTouchUpInside];
    [_sortButton.layer setBorderWidth:2];
    [_sortButton.layer setBorderColor:color];
    _sortButton.titleLabel.tintColor = [UIColor whiteColor];
    _sortButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_sortButton.layer setMasksToBounds:YES];
    [_sortButton.layer setCornerRadius:5.0];
    [self.view addSubview:_sortButton];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, width, 400) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[NewTableViewCell class] forCellReuseIdentifier:@"show"];
    
    //注册通知中心
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(transArray:) name:@"array" object:nil];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"show" forIndexPath:indexPath];
    cell.nameLabel.text = _nameArray[indexPath.row];
    cell.classLabel.text = _classArray[indexPath.row];
    cell.gradeLabel.text = _gradeArray[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.userInteractionEnabled = NO;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _nameArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)increase:(UIButton*)button {
    IncreaseViewController *increase = [[IncreaseViewController alloc] init];
    increase.modalPresentationStyle = UIModalPresentationFullScreen;
    increase.delegate = self;
    increase.nameArray = _nameArray;
    increase.classArray = _classArray;
    increase.gradeArray = _gradeArray;
    [self presentViewController:increase animated:YES completion:nil];
}

- (void)increaseInformation:(NSMutableArray *)informationArray {
    [_nameArray addObject:informationArray[0]];
    [_classArray addObject:informationArray[1]];
    [_gradeArray addObject:informationArray[2]];
    [_tableView reloadData];
}

- (void)delete:(UIButton*)button {
    DeleteViewController *delete = [[DeleteViewController alloc] init];
    delete.modalPresentationStyle = UIModalPresentationFullScreen;
    delete.delegate = self;
    //设置监听
    [delete addObserver:self forKeyPath:@"index" options:NSKeyValueObservingOptionNew context:nil];
    delete.nameArray = _nameArray;
    delete.classArray = _classArray;
    delete.gradeArray = _gradeArray;
    [self presentViewController:delete animated:YES completion:nil];
}

//监听函数
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    id value = [change valueForKey:@"new"];
    NSInteger num = [value intValue];
    [_nameArray removeObjectAtIndex:num];
    [_classArray removeObjectAtIndex:num];
    [_gradeArray removeObjectAtIndex:num];
    [_tableView reloadData];
}

//协议传值
//- (void)deleteInformation:(NSInteger)indexNumber {
//    [_nameArray removeObjectAtIndex:indexNumber];
//    [_classArray removeObjectAtIndex:indexNumber];
//    [_gradeArray removeObjectAtIndex:indexNumber];
//    [_tableView reloadData];
//}

- (void)change:(UIButton*)button {
    ChangeViewController *change = [[ChangeViewController alloc] init];
    change.modalPresentationStyle = UIModalPresentationFullScreen;
    change.delegate = self;
    change.nameArray = _nameArray;
    change.classArray = _classArray;
    change.gradeArray = _gradeArray;
    [self presentViewController:change animated:YES completion:nil];
}

//通知传值
- (void)transArray:(NSNotification*)allArray {
    NSString *str = allArray.userInfo[@"index"];
    NSInteger num = [str intValue];
    NSArray *array = [[NSArray alloc] initWithArray:allArray.userInfo[@"array"]];
    [_nameArray replaceObjectAtIndex:num withObject:array[0]];
    [_classArray replaceObjectAtIndex:num withObject:array[1]];
    [_gradeArray replaceObjectAtIndex:num withObject:array[2]];
    [_tableView reloadData];
}

//协议传值
//- (void)changeInformation:(NSMutableArray *)informationArray andIndex:(NSInteger)indexNumber {
//    [_nameArray replaceObjectAtIndex:indexNumber withObject:informationArray[0]];
//    [_classArray replaceObjectAtIndex:indexNumber withObject:informationArray[1]];
//    [_gradeArray replaceObjectAtIndex:indexNumber withObject:informationArray[2]];
//    [_tableView reloadData];
//}

- (void)search:(UIButton*)button {
    SearchViewController *search = [[SearchViewController alloc] init];
    search.modalPresentationStyle = UIModalPresentationFullScreen;
    search.nameArray = _nameArray;
    search.classArray = _classArray;
    search.gradeArray = _gradeArray;
    [self presentViewController:search animated:YES completion:nil];
}

- (void)end:(UIButton*)button {
    exit(0);
}

- (void)sort:(UIButton*)button {
    SortViewController *sort = [[SortViewController alloc] init];
    sort.modalPresentationStyle = UIModalPresentationFullScreen;
    sort.nameArray = _nameArray;
    sort.classArray = _classArray;
    sort.gradeArray = _gradeArray;
    sort.delegate = self;
    sort.changeArray = ^(NSMutableArray *nameArray, NSMutableArray *classArray, NSMutableArray *gradeArray) {
        self->_nameArray = nameArray;
        self->_classArray = classArray;
        self->_gradeArray = gradeArray;
        [self->_tableView reloadData];
    };
    [self presentViewController:sort animated:YES completion:nil];
}

//- (void)aNameArray:(NSMutableArray *)nameArray andClass:(NSMutableArray *)classArray andGrade:(NSMutableArray *)gradeArray {
//    _nameArray = nameArray;
//    _classArray = classArray;
//    _gradeArray = gradeArray;
//    [_tableView reloadData];
//}

- (void)arrayInit {
    _nameArray = [[NSMutableArray alloc] init];
    [_nameArray addObject:@"张三"];
    [_nameArray addObject:@"李四"];
    [_nameArray addObject:@"王麻子"];
    [_nameArray addObject:@"王者king"];
    
    _classArray = [[NSMutableArray alloc] init];
    [_classArray addObject:@"一班"];
    [_classArray addObject:@"二班"];
    [_classArray addObject:@"三班"];
    [_classArray addObject:@"四班"];
    
    _gradeArray = [[NSMutableArray alloc] init];
    [_gradeArray addObject:@"99"];
    [_gradeArray addObject:@"68"];
    [_gradeArray addObject:@"100"];
    [_gradeArray addObject:@"88"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
