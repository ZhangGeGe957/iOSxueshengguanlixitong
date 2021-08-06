//
//  SortViewController.m
//  学生管理系统
//
//  Created by 张佳乔 on 2021/8/4.
//

#import "SortViewController.h"
#import "NewTableViewCell.h"

#define width [UIScreen mainScreen].bounds.size.width
#define heigth [UIScreen mainScreen].bounds.size.height

@interface SortViewController ()

@end

@implementation SortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];

    _allArray = [[NSMutableArray alloc] initWithObjects:_nameArray, _classArray, _gradeArray, nil];
    
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){1,1,1,1});
    
    _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"show.jpeg"]];
    _backImageView.frame = CGRectMake(0, 0, width, heigth);
    [self.view addSubview:_backImageView];
    
    _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_backButton setTitle:@"返回" forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    _backButton.frame = CGRectMake(250, 750, 100, 40);
    [_backButton.layer setBorderWidth:2];
    [_backButton.layer setBorderColor:color];
    _backButton.titleLabel.tintColor = [UIColor whiteColor];
    _backButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_backButton.layer setMasksToBounds:YES];
    [_backButton.layer setCornerRadius:5.0];
    [self.view addSubview:_backButton];
    
    _riseNameButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_riseNameButton setTitle:@"姓名升序" forState:UIControlStateNormal];
    [_riseNameButton addTarget:self action:@selector(riseName:) forControlEvents:UIControlEventTouchUpInside];
    _riseNameButton.frame = CGRectMake(70, 530, 100, 40);
    [_riseNameButton.layer setBorderWidth:2];
    [_riseNameButton.layer setBorderColor:color];
    _riseNameButton.titleLabel.tintColor = [UIColor whiteColor];
    _riseNameButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_riseNameButton.layer setMasksToBounds:YES];
    [_riseNameButton.layer setCornerRadius:5.0];
    [self.view addSubview:_riseNameButton];
    
    _declineNameButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_declineNameButton setTitle:@"姓名降序" forState:UIControlStateNormal];
    [_declineNameButton addTarget:self action:@selector(declineName:) forControlEvents:UIControlEventTouchUpInside];
    _declineNameButton.frame = CGRectMake(250, 530, 100, 40);
    [_declineNameButton.layer setBorderWidth:2];
    [_declineNameButton.layer setBorderColor:color];
    _declineNameButton.titleLabel.tintColor = [UIColor whiteColor];
    _declineNameButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_declineNameButton.layer setMasksToBounds:YES];
    [_declineNameButton.layer setCornerRadius:5.0];
    [self.view addSubview:_declineNameButton];
    
    _riseClassButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_riseClassButton setTitle:@"班级升序" forState:UIControlStateNormal];
    [_riseClassButton addTarget:self action:@selector(riseClass:) forControlEvents:UIControlEventTouchUpInside];
    _riseClassButton.frame = CGRectMake(70, 600, 100, 40);
    [_riseClassButton.layer setBorderWidth:2];
    [_riseClassButton.layer setBorderColor:color];
    _riseClassButton.titleLabel.tintColor = [UIColor whiteColor];
    _riseClassButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_riseClassButton.layer setMasksToBounds:YES];
    [_riseClassButton.layer setCornerRadius:5.0];
    [self.view addSubview:_riseClassButton];
    
    _declineClassButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_declineClassButton setTitle:@"班级降序" forState:UIControlStateNormal];
    [_declineClassButton addTarget:self action:@selector(declineClass:) forControlEvents:UIControlEventTouchUpInside];
    _declineClassButton.frame = CGRectMake(250, 600, 100, 40);
    [_declineClassButton.layer setBorderWidth:2];
    [_declineClassButton.layer setBorderColor:color];
    _declineClassButton.titleLabel.tintColor = [UIColor whiteColor];
    _declineClassButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_declineClassButton.layer setMasksToBounds:YES];
    [_declineClassButton.layer setCornerRadius:5.0];
    [self.view addSubview:_declineClassButton];
    
    _riseGradeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_riseGradeButton setTitle:@"成绩升序" forState:UIControlStateNormal];
    [_riseGradeButton addTarget:self action:@selector(riseGrade:) forControlEvents:UIControlEventTouchUpInside];
    _riseGradeButton.frame = CGRectMake(70, 670, 100, 40);
    [_riseGradeButton.layer setBorderWidth:2];
    [_riseGradeButton.layer setBorderColor:color];
    _riseGradeButton.titleLabel.tintColor = [UIColor whiteColor];
    _riseGradeButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_riseGradeButton.layer setMasksToBounds:YES];
    [_riseGradeButton.layer setCornerRadius:5.0];
    [self.view addSubview:_riseGradeButton];
    
    _declineGradeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_declineGradeButton setTitle:@"成绩降序" forState:UIControlStateNormal];
    [_declineGradeButton addTarget:self action:@selector(declineGrade:) forControlEvents:UIControlEventTouchUpInside];
    _declineGradeButton.frame = CGRectMake(250, 670, 100, 40);
    [_declineGradeButton.layer setBorderWidth:2];
    [_declineGradeButton.layer setBorderColor:color];
    _declineGradeButton.titleLabel.tintColor = [UIColor whiteColor];
    _declineGradeButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_declineGradeButton.layer setMasksToBounds:YES];
    [_declineGradeButton.layer setCornerRadius:5.0];
    [self.view addSubview:_declineGradeButton];
    
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
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, width, 400) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[NewTableViewCell class] forCellReuseIdentifier:@"show"];
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

- (void)riseName:(UIButton*)button {
    NSString *oneStr = [[NSString alloc] init];
    NSString *twoStr = [[NSString alloc] init];
    NSString *threeStr = [[NSString alloc] init];
    for (int i = 0; i < _nameArray.count - 1; i++) {
        for (int j = 0; j < _nameArray.count - 1 - i; j++) {
            char *str1 = [[self firstCharactor:_nameArray[j]] UTF8String];
            char *str2 = [[self firstCharactor:_nameArray[j + 1]] UTF8String];
            
            if (strcmp(str1, str2) > 0) {
                oneStr = _nameArray[j];
                _nameArray[j] = _nameArray[j + 1];
                _nameArray[j + 1] = oneStr;
                
                twoStr = _classArray[j];
                _classArray[j] = _classArray[j + 1];
                _classArray[j + 1] = twoStr;
                
                threeStr = _gradeArray[j];
                _gradeArray[j] = _gradeArray[j + 1];
                _gradeArray[j + 1] = threeStr;
            }
        }
    }
//    [_delegate aNameArray:_nameArray andClass:_classArray andGrade:_gradeArray];
    //block传值
    if (self.changeArray) {
        _changeArray(_nameArray, _classArray, _gradeArray);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)declineName:(UIButton*)button {
    NSString *oneStr = [[NSString alloc] init];
    NSString *twoStr = [[NSString alloc] init];
    NSString *threeStr = [[NSString alloc] init];
    for (int i = 0; i < _nameArray.count - 1; i++) {
        for (int j = 0; j < _nameArray.count - 1 - i; j++) {
            char *str1 = [[self firstCharactor:_nameArray[j]] UTF8String];
            char *str2 = [[self firstCharactor:_nameArray[j + 1]] UTF8String];
            
            if (strcmp(str1, str2) < 0) {
                oneStr = _nameArray[j];
                _nameArray[j] = _nameArray[j + 1];
                _nameArray[j + 1] = oneStr;
                
                twoStr = _classArray[j];
                _classArray[j] = _classArray[j + 1];
                _classArray[j + 1] = twoStr;
                
                threeStr = _gradeArray[j];
                _gradeArray[j] = _gradeArray[j + 1];
                _gradeArray[j + 1] = threeStr;
            }
        }
    }
//    [_delegate aNameArray:_nameArray andClass:_classArray andGrade:_gradeArray];
    //block传值
    if (self.changeArray) {
        _changeArray(_nameArray, _classArray, _gradeArray);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
- (NSString *)firstCharactor:(NSString *)aString {
    //把汉字转换成拼音第一种方法
    NSString *str = [[NSString alloc]initWithString:aString];
    //NSString 转换成 CFStringRef 型
    CFStringRef string1 = (CFStringRef)CFBridgingRetain(str);
    //汉字转换成拼音
    CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0, string1);
    //拼音（带声调的）
    CFStringTransform(string, NULL, kCFStringTransformMandarinLatin, NO);
    //去掉声调符号
    CFStringTransform(string, NULL, kCFStringTransformStripDiacritics, NO);
    //CFStringRef 转换成 NSString
    NSString *strings = (NSString *)CFBridgingRelease(string);
    //去掉空格
    NSString *cityString = [strings stringByReplacingOccurrencesOfString:@" " withString:@""];
    //获取并返回首字母
    return [cityString substringToIndex:1];
}

- (void)riseClass:(UIButton*)button {
    NSString *oneStr = [[NSString alloc] init];
    NSString *twoStr = [[NSString alloc] init];
    NSString *threeStr = [[NSString alloc] init];
    for (int i = 0; i < _classArray.count - 1; i++) {
        for (int j = 0; j < _classArray.count - 1 - i; j++) {
            if ([self chineseCharacters:_classArray[j]] > [self chineseCharacters:_classArray[j + 1]]) {
                oneStr = _nameArray[j];
                _nameArray[j] = _nameArray[j + 1];
                _nameArray[j + 1] = oneStr;
                
                twoStr = _classArray[j];
                _classArray[j] = _classArray[j + 1];
                _classArray[j + 1] = twoStr;
                
                threeStr = _gradeArray[j];
                _gradeArray[j] = _gradeArray[j + 1];
                _gradeArray[j + 1] = threeStr;
            }
        }
    }
//    [_delegate aNameArray:_nameArray andClass:_classArray andGrade:_gradeArray];
    //block传值
    if (self.changeArray) {
        _changeArray(_nameArray, _classArray, _gradeArray);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)declineClass:(UIButton*)button {
    NSString *oneStr = [[NSString alloc] init];
    NSString *twoStr = [[NSString alloc] init];
    NSString *threeStr = [[NSString alloc] init];
    for (int i = 0; i < _classArray.count - 1; i++) {
        for (int j = 0; j < _classArray.count - 1 - i; j++) {
            if ([self chineseCharacters:_classArray[j]] < [self chineseCharacters:_classArray[j + 1]]) {
                oneStr = _nameArray[j];
                _nameArray[j] = _nameArray[j + 1];
                _nameArray[j + 1] = oneStr;
                
                twoStr = _classArray[j];
                _classArray[j] = _classArray[j + 1];
                _classArray[j + 1] = twoStr;
                
                threeStr = _gradeArray[j];
                _gradeArray[j] = _gradeArray[j + 1];
                _gradeArray[j + 1] = threeStr;
            }
        }
    }
//    [_delegate aNameArray:_nameArray andClass:_classArray andGrade:_gradeArray];
    //block传值
    if (self.changeArray) {
        _changeArray(_nameArray, _classArray, _gradeArray);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)chineseCharacters:(NSString*)string {
    NSArray *characters = [[NSArray alloc] initWithObjects:@"一", @"二", @"三", @"四", @"五", @"六", @"七", @"八", @"九", @"十", nil];
    NSString *first = [string substringToIndex:1];
    for (int i = 0; i < characters.count; i++) {
        if ([first isEqualToString:characters[i]]) {
            return i + 1;
        }
    }
    return 0;
}

- (void)riseGrade:(UIButton*)button {
    NSString *oneStr = [[NSString alloc] init];
    NSString *twoStr = [[NSString alloc] init];
    NSString *threeStr = [[NSString alloc] init];
    for (int i = 0; i < _gradeArray.count - 1; i++) {
        for (int j = 0; j < _gradeArray.count - 1 - i; j++) {
            if ([_gradeArray[j] intValue] > [_gradeArray[j + 1] intValue]) {
                oneStr = _nameArray[j];
                _nameArray[j] = _nameArray[j + 1];
                _nameArray[j + 1] = oneStr;
                
                twoStr = _classArray[j];
                _classArray[j] = _classArray[j + 1];
                _classArray[j + 1] = twoStr;
                
                threeStr = _gradeArray[j];
                _gradeArray[j] = _gradeArray[j + 1];
                _gradeArray[j + 1] = threeStr;
            }
        }
    }
//    [_delegate aNameArray:_nameArray andClass:_classArray andGrade:_gradeArray];
    //block传值
    if (self.changeArray) {
        _changeArray(_nameArray, _classArray, _gradeArray);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)declineGrade:(UIButton*)button {
    NSString *oneStr = [[NSString alloc] init];
    NSString *twoStr = [[NSString alloc] init];
    NSString *threeStr = [[NSString alloc] init];
    for (int i = 0; i < _gradeArray.count - 1; i++) {
        for (int j = 0; j < _gradeArray.count - 1 - i; j++) {
            if ([_gradeArray[j] intValue] < [_gradeArray[j + 1] intValue]) {
                oneStr = _nameArray[j];
                _nameArray[j] = _nameArray[j + 1];
                _nameArray[j + 1] = oneStr;
                
                twoStr = _classArray[j];
                _classArray[j] = _classArray[j + 1];
                _classArray[j + 1] = twoStr;
                
                threeStr = _gradeArray[j];
                _gradeArray[j] = _gradeArray[j + 1];
                _gradeArray[j + 1] = threeStr;
            }
        }
    }
//    [_delegate aNameArray:_nameArray andClass:_classArray andGrade:_gradeArray];
    //block传值
    if (self.changeArray) {
        _changeArray(_nameArray, _classArray, _gradeArray);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)back:(UIButton*)button {
    [self dismissViewControllerAnimated:YES completion:nil];
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
