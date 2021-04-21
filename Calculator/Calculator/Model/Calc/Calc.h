//
//  Calc.h
//  Calculator
//
//  Created by Denis Dmitriev on 17.04.2021.
//

#import <Foundation/Foundation.h>
#import "CalcOperation.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef CGFloat (^CalcBlockDouble) (CGFloat valueA, CGFloat valueB);
typedef CGFloat (^CalcBlockSingle) (CGFloat value);

@interface Calc : NSObject

- (instancetype)initWithOperation:(CalcOperation)operation;

@property (nonatomic) CalcOperation operation;
@property (nonatomic) CGFloat previusValue;
@property (nonatomic) CGFloat currentValue;
@property (nonatomic) BOOL nextInput;

- (void)reset;
- (void)compute:(NSString *)value;
- (void)getOperationFrom:(NSString *)title;
- (void)unar;

@end

NS_ASSUME_NONNULL_END
