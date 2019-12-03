//
//  JATCard.m
//  DeckOfOneCard-C
//
//  Created by Anthony Torres on 12/3/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

#import "JATCard.h"

@implementation JATCard

- (instancetype)initWithSuit:(NSString *)suit value:(NSString *)value image:(NSString *)image
{
    self = [super init];
    if (self)
    {
        _suit = suit;
        _value = value;
        _image = image;
        
    }
    return self;
}

@end

@implementation JATCard (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *suit = dictionary[@"suit"];
    NSString *value = dictionary[@"vaule"];
    NSString *image = dictionary[@"image"];
    
    return [self initWithSuit:suit value:value image:image];
}

@end
