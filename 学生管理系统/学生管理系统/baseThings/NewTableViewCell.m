//
//  NewTableViewCell.m
//  学生管理系统
//
//  Created by 张佳乔 on 2021/8/1.
//

#import "NewTableViewCell.h"

#define width [UIScreen mainScreen].bounds.size.width
#define heigth [UIScreen mainScreen].bounds.size.height

@implementation NewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"show"]) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:24];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_nameLabel];
        
        _classLabel = [[UILabel alloc] init];
        _classLabel.font = [UIFont systemFontOfSize:24];
        _classLabel.textAlignment = NSTextAlignmentCenter;
        _classLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_classLabel];
        
        _gradeLabel = [[UILabel alloc] init];
        _gradeLabel.font = [UIFont systemFontOfSize:24];
        _gradeLabel.textAlignment = NSTextAlignmentCenter;
        _gradeLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_gradeLabel];
    }
    return self;
}

- (void)layoutSubviews {
    _nameLabel.frame = CGRectMake(0, 0, 150, 50);
    _classLabel.frame = CGRectMake(150, 0, 150, 50);
    _gradeLabel.frame = CGRectMake(300, 0, 150, 50);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
