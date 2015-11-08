//
//  EmptyDataManager.h
//  AppTemplateForNormal
//
//  Created by crw on 10/19/15.
//  Copyright © 2015 ZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIScrollView+EmptyDataSet.h"

typedef NS_ENUM (NSInteger,EmptyDataType){
    EmptyDataTypeMenu = 0,
    EmptyDataTypeCart
};

typedef void(^buttonClickBlock)();

@interface EmptyDataManager : NSObject<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

- (instancetype)initWithEmptyDataType:(EmptyDataType)type buttonClickBlock:(buttonClickBlock)block;

@end
