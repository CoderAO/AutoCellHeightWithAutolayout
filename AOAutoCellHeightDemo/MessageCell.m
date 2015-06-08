//
//  MessageCell.m
//  AOAutoCellHeightDemo
//
//  Created by 敖然 on 15/6/8.
//  Copyright (c) 2015年 AT. All rights reserved.
//

#import "MessageCell.h"
#import "Message.h"

@interface MessageCell()

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelTopConstraint;

@end

@implementation MessageCell
- (void)awakeFromNib {
    self.contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
}

- (void)setMessage:(Message *)message {
    _message = message;
    if (_message.content.length) {
        self.contentLabel.text = _message.content;
        // 有文字的时候距离顶部是10
        self.labelTopConstraint.constant = 10;
    }
    else {
        self.contentLabel.text = nil;
        // 没文字的时候距离顶部为0
        self.labelTopConstraint.constant = 0;
    }

    [self layoutIfNeeded];
    if (_message.imageName) {
        self.contentImageView.image = [UIImage imageNamed:_message.imageName];
        [self layoutIfNeeded];
        self.message.cellHeight = CGRectGetMaxY(self.contentImageView.frame) + 10;
    }
    else {
        self.contentImageView.image = nil;
        self.message.cellHeight = CGRectGetMaxY(self.contentLabel.frame) + 10;
    }
}

@end
