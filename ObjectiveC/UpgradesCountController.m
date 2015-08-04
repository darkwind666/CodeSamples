//
//  AllAvailableUpgradesCount.m
//  Rocket
//
//  Created by Администратор on 8/6/14.
//  Copyright (c) 2014 Саша. All rights reserved.
//

#import "UpgradesCountController.h"
#import "UpgradesCountControllerDataSourceProtocol.h"
#import "CCNode+AddMethods.h"
#import "CCLabelTTF+TextStyle.h"
#import "cocos2d.h"
#import "GameStyleConstants.h"
#import "ScreensElementsConstants.h"

@implementation UpgradesCountController {
    
    UpgradesCountControllerDataSource  _dataSource;
    CCLabelTTF *_upgradesCount;
    
}

-(id)initWithDataSource: (UpgradesCountControllerDataSource) aDataSource {
    
    if (self = [super init]) {
        _dataSource = aDataSource;
        
        CCLabelTTF *upgradesCount = [CCLabelTTF createLabelWithoutStrokeWithFontSize: upgradesCountTextSize];
        _upgradesCount = upgradesCount;
        
        [self addSpriteWithKey:upgradesCircleKey];
        [self addChild:upgradesCount key:upgradesCountLabelKey];
        
        [self update];
    }
    
    return self;
    
}

-(void)update {
    
    NSString *upgradesCount = _dataSource();
    
    int upgradesCountValue = [upgradesCount intValue];
    
    if (upgradesCountValue <= 0) {
        self.visible = NO;
    } else {
        self.visible = YES;
    }
    
    [_upgradesCount setString: upgradesCount];
    
}
@end
