/*
 * Copyright (c) 2018 Identos GmbH
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the Precise Biometrics AB nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
 * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
 * THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 *
 */

#import "PersonalDataUtilities.h"

@implementation PersonalDataUtilities

+ (NSArray*)personToArray:(PBPersonalData*)personalData {
    NSMutableArray* array = [[NSMutableArray alloc] init];
    
    [self addItemTo:array withTitle:@"Insurant ID" andValue:personalData.insurantId];
    [self addItemTo:array withTitle:@"First name" andValue:personalData.firstName];
    [self addItemTo:array withTitle:@"Last name" andValue:personalData.lastName];
    [self addItemTo:array withTitle:@"Birthdate" andValue:personalData.birthdate];
    [self addItemTo:array withTitle:@"Name prefix" andValue:personalData.namePrefix];
    [self addItemTo:array withTitle:@"Name suffix" andValue:personalData.nameSuffix];
    [self addItemTo:array withTitle:@"Title" andValue:personalData.title];

    return array;
}

+ (NSArray*)addressToArray:(PBAddress*)address {
    if (address == nil) {
        return nil;
    }
    
    NSMutableArray* array = [[NSMutableArray alloc] init];
    
    [self addItemTo:array withTitle:@"Postal code" andValue:address.postalCode];
    [self addItemTo:array withTitle:@"City" andValue:address.city];
    [self addItemTo:array withTitle:@"Street" andValue:address.street];
    [self addItemTo:array withTitle:@"House number" andValue:address.houseNumber];
    [self addItemTo:array withTitle:@"Post box" andValue:address.postBox];
    [self addItemTo:array withTitle:@"Addition" andValue:address.addition];
    [self addItemTo:array withTitle:@"Country code" andValue:address.countryCode];

    return array;
}

+ (void)addItemTo:(NSMutableArray*)array withTitle:(NSString*)title andValue:(NSString*)value {
    if (value != nil) {
        [array addObject:@[title, value]];
    }
}

@end
