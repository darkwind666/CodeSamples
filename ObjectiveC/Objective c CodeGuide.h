//
//  CodeGuide.h
//  Rocket
//
//  Created by Администратор on 8/6/13.
//  Copyright (c) 2013 Саша. All rights reserved.
//

1)Названия классов:

1.1) модели: 

@interface MainGamePlayerDataSource
@interface NextGameDataSource

1.2) контроллеры:

@interface StartGameController

1.3) представления:

@interface PlayerStateIndicatorView

1.4) фабрики:

@interface EffectsOnPlayerFactory

1.5) наблюдатели:

@interface PlayerActionObserver

2)Названия локальных переменных:

int sparkLines
int indent

3)Названия переменных класса:

NSDictionary *_mainGamePlayer
MainGameResultDelegate *_resultDelegate

4)Названия констант:

kBatchNodeZOrder
kBackGroundZOrder

5)если константы образуют одну группу, то объединяем их в перечисления:

typedef enum {
    kBatchNodeZOrder,
    kRocketBatchNodeAndMenuZOrder,
} ScreenZOrder;

6) названия методов:

-(void)createStaticScreenImages
-(void)createIndicator

7) если существует переменная с таким названием как и аргумент, то прибавляем префикс
а (аргумент).

-(void)createBackground: (CCSpriteBatchNode*)aBatchNode

8) если метод со многими аргументами то разбиваем их построчно:

-(void)setSprite:(CCSprite*)sprite
       inBatchNode: (CCSpriteBatchNode*)aBatchNode
       position: (CGPoint)point
       zValue: (ScreenOrder)zValue

9) используем пояснительные временные переменные для удобочитаемости кода:

int sparkLines = 3;
int indent = 0;

11) если функция получилась слишком большой то пытаемся разбить её на подфункции(>20 строчек):

-(void)createStaticScreenImages{
    
    [self createBackground: batchNode];
    [self createLight: batchNode];
    [self createLogos: batchNode];
    
}

12) позиция фигурных скобок и строковые разделители между ними:{
    
    [self createBackground: batchNode];
    [self createLight: batchNode];
    [self createLogos: batchNode];
    
}

13) используем макросы #define для определения имён файлов, пише их как и константы вверху файла:

#define loadGamePlistForSpriteSheet @"LoadGame.plist"
#define texturesForSpriteSheet @"LoadGame.png"

NSString *const texturesForSpriteSheet = @"LoadGame.png";

14) блоки:

typedef void(^BuyCallback)(void)
typedef void(^CollisionEvent)(void)
typedef BOOL(^UseBonusHandler)(void)

CollisionEvent event = ^ {
    IncomeComponent *playerIncomeComponent = _player[NSStringFromClass([IncomeComponent class])];
    int newPlayerIncome = playerIncomeComponent.income + upMoneyValue + upMoneyValue * playerIncomeComponent.incomePower;
    playerIncomeComponent.income = newPlayerIncome;
};


15) категории:

@interface CCLayer (SetMethods)

16)протоколы:

@protocol TransitionManagerDelegateProtocol
-(void)goToScreen: (NSString*) aScreen;
-(void)goToPreviousScene;
@end

17) делаем пробелы между операторами:

[self setEntitiesCount: objectsCount + 1 withAvailablePositions: availablePositions];





