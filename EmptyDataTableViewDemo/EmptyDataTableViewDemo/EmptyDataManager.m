//
//  EmptyDataManager.m
//  AppTemplateForNormal
//
//  Created by crw on 10/19/15.
//  Copyright © 2015 ZQ. All rights reserved.
//

#import "EmptyDataManager.h"

@interface EmptyDataManager()
@end

@implementation EmptyDataManager{
    EmptyDataType       _type;
    buttonClickBlock    _block;
}

- (instancetype)initWithEmptyDataType:(EmptyDataType)type buttonClickBlock:(buttonClickBlock)block{
    if(self == [super init]){
        _type   = type;
        _block  = block;
    }
    return self;
}

#pragma mark - DZNEmptyDataSetSource Methods

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = nil;
    UIFont *font = nil;
    UIColor *textColor = nil;
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    
    switch (_type) {
        case EmptyDataTypeMenu:
        {
            text = @"No Menu";
            font = [UIFont systemFontOfSize:16];
            textColor = [UIColor greenColor];
            break;
        }
        case EmptyDataTypeCart:{
            text = @"购物车🈳️🈳️如也";
            font = [UIFont systemFontOfSize:14];
            textColor = [UIColor grayColor];
            break;
        }
        default:
            return nil;
    }
    
    if (!text) {
        return nil;
    }
    
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = nil;
    UIFont *font = nil;
    UIColor *textColor = nil;
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    switch (_type) {
        case EmptyDataTypeMenu:
        {
            //text = @"Get started by uploading a photo.";
            font = [UIFont boldSystemFontOfSize:15.0];
            textColor = [UIColor redColor];
            break;
        }
        default:
            return nil;
    }
    
    if (!text) {
        return nil;
    }
    
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    if (paragraph) [attributes setObject:paragraph forKey:NSParagraphStyleAttributeName];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
    
    switch (_type) {
        //case ApplicationTypeSkype:
        //    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHex:@"00adf1"] range:[attributedString.string rangeOfString:@"add favorites"]];
        //    break;
            
        default:
            break;
    }
    
    return attributedString;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *imageName = [[[NSString stringWithFormat:@"placeholder_%@", @"vesper"] lowercaseString]
                           stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    
    return [UIImage imageNamed:imageName];
}

- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0) ];
    animation.duration = 0.25;
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    
    return animation;
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    NSString *text = nil;
    UIFont *font = nil;
    UIColor *textColor = nil;
    
    switch (_type) {
        case EmptyDataTypeCart:
        {
            text = @"到处逛逛";
            font = [UIFont boldSystemFontOfSize:16.0];
            break;
        }
        default:
            return nil;
    }
    
    if (!text) {
        return nil;
    }
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    NSString *imageName = [[NSString stringWithFormat:@"button_background_%@", @"icloud"] lowercaseString];
    
    if (state == UIControlStateNormal) imageName = [imageName stringByAppendingString:@"_normal"];
    if (state == UIControlStateHighlighted) imageName = [imageName stringByAppendingString:@"_highlight"];
    
    UIEdgeInsets capInsets = UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0);
    UIEdgeInsets rectInsets = UIEdgeInsetsZero;
    
    switch (_type) {
        case EmptyDataTypeCart:
            rectInsets = UIEdgeInsetsMake(-19.0, -61.0, -19.0, -61.0);
            break;
        default:
            break;
    }
    
    return [[[UIImage imageNamed:imageName] resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeStretch] imageWithAlignmentRectInsets:rectInsets];
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    switch (_type) {
        case EmptyDataTypeMenu:         return [UIColor whiteColor];
        case EmptyDataTypeCart:         return [UIColor whiteColor];
        default:                        return nil;
    }
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
//    if (_type == EmptyDataTypeMenu) {
//        CGFloat offset = CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
//        offset += CGRectGetHeight(self.navigationController.navigationBar.frame);
//        return -offset;
//    }
//    if (_type == EmptyDataTypeMenu) {
//        return -roundf(self.tableView.frame.size.height/2.5);
//    }
    return 0.0;
}

- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView
{
    switch (_type) {
        case EmptyDataTypeMenu:             return 9.0;
        default:                            return 0.0;
    }
}


#pragma mark - DZNEmptyDataSetDelegate Methods

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView
{
    return NO;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{
   
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
    if (_block) {
        _block();
    }
}


@end
