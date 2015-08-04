//
//  AllAvailableUpgradesCount.h
//  Rocket
//
//  Created by Администратор on 8/6/14.
//  Copyright (c) 2014 Саша. All rights reserved.
//

#import "UpdatableController.h"
#import "BlocksNames.h"

@interface UpgradesCountController : UpdatableController

-(id)initWithDataSource: (UpgradesCountControllerDataSource) aDataSource;

-(void)update;

@end
