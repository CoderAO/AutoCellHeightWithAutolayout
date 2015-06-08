//
//  ViewController.m
//  AOAutoCellHeightDemo
//
//  Created by 敖然 on 15/6/7.
//  Copyright (c) 2015年 AT. All rights reserved.
//

#import "ViewController.h"
#import "Message.h"
#import "MessageCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dataList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"MessageCell" bundle:nil] forCellReuseIdentifier:@"MessageCell"];
}

- (NSArray *)dataList {
    if (!_dataList) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"messages" ofType:@"plist"];
        NSArray *originArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *mArry = [NSMutableArray array];
        for (NSDictionary *dic in originArray) {
            Message *model = [Message messageWithDic:dic];
            [mArry addObject:model];
        }
        [mArry addObjectsFromArray:mArry];

        _dataList = mArry;
    }
    return _dataList;
}

#pragma mark - UITableViewDataSource & UITabBarDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    Message *message = self.dataList[indexPath.row];
    return message.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {;
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell"];
    cell.message = self.dataList[indexPath.row];
    return cell;
}




@end
